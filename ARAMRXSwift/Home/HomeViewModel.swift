//
//  HomeViewModel.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/04/26.
//

import Foundation
import RxSwift
import RxCocoa
import Differentiator

protocol ViewModelType {

    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

struct HomeViewModel: ViewModelType {

    let disposeBag = DisposeBag()

    let network: SearchNetwork

    let rankNetwork: RankNetwork

    let matchNetwork: MatchNetwork

    init(network: SearchNetwork = SearchNetwork(),
         rankNetwork: RankNetwork = RankNetwork(),
         matchNetwork: MatchNetwork = MatchNetwork()) {
        self.network = network
        self.rankNetwork = rankNetwork
        self.matchNetwork = matchNetwork
    }

    struct Input {
        let searchText: Driver<String>
    }

    struct Output {
        let user: Driver<User>
        let profileImageUrl: Driver<URL?>
        let rank: Driver<[Rank]>
        let section: Driver<[SectionModel<String, String>]>
        let matchId: Driver<[String]>
    }

    func transform(input: Input) -> Output {

        let userRelay: PublishRelay<User> = PublishRelay()
        let profileImageUrl: PublishRelay<URL?> = PublishRelay()
        let rankRelay: PublishRelay<[Rank]> = PublishRelay()
        let sectionSubject: PublishSubject<[SectionModel<String, String>]> = PublishSubject()
        let matchIdRelay: PublishRelay<[String]> = PublishRelay()

        input.searchText
            .debounce(RxTimeInterval.seconds(1))
            .distinctUntilChanged()
            .flatMapLatest({ query -> Driver<User> in
                let summoner = network.searchSummoner(name: query.lowercased())
                return summoner
            })
            .drive(onNext: { user in
                userRelay.accept(user)
                print("user.name: \(user.name)")
                print("user.name: \(user.summonerLevel)")
            })
            .disposed(by: disposeBag)

        userRelay
            .flatMapLatest({ user -> Driver<URL> in
                return network.getProfileImage(id: String(user.profileIconId))
            })
            .asDriver(onErrorDriveWith: .never())
            .drive(onNext: { url in
                profileImageUrl.accept(url)
            })
            .disposed(by: disposeBag)

        userRelay
            .flatMapLatest({ user -> Driver<[Rank]> in
                return rankNetwork.requestRank(id: user.id)
            })
            .asDriver(onErrorDriveWith: .never())
            .drive(onNext: { rank in
                rankRelay.accept(rank)
            })
            .disposed(by: disposeBag)

        userRelay
            .flatMapLatest { user -> Driver<[String]> in
                return matchNetwork.getMatchId(puuId: user.puuid)
            }
            .asDriver(onErrorDriveWith: .never())
            .drive(onNext: { match in
                matchIdRelay.accept(match)
                sectionSubject.onNext([SectionModel(model: "", items: match)])
            })
            .disposed(by: disposeBag)

        return Output(user: userRelay.asDriver(onErrorDriveWith: .never()),
                      profileImageUrl: profileImageUrl.asDriver(onErrorJustReturn: nil),
                      rank: rankRelay.asDriver(onErrorDriveWith: .never()),
                      section: sectionSubject.asDriver(onErrorDriveWith: .never()),
                      matchId: matchIdRelay.asDriver(onErrorDriveWith: .never()))
    }
}

// MARK: - Important!!
// Network에서 계속 disposed 나오는 경우는 메서드 안에 provider를 선언해줘서 그렇다.
// throttle - 1초이면 입력 시간으로 부터 1초후에 데이터 검색 및 방출 (중도 방출)?
// debounce - 1초이면 행동이 끝난 1초후에 데이터 검색 및 방출 (끝까지 기다렸다 방출)?
