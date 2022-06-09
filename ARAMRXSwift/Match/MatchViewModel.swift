//
//  MatchViewModel.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/05/13.
//

import Foundation
import RxSwift
import RxCocoa
import Differentiator

enum ParticipantInfo {
    case champion(String)
    case level(String)
    case kda(String)
}

struct MatchViewModel: ViewModelType {

    let disposeBag = DisposeBag()

    let network: MatchNetwork

    let matchId: BehaviorRelay<String>

    init(network: MatchNetwork = MatchNetwork(), matchId: BehaviorRelay<String>) {
        self.network = network
        self.matchId = matchId
    }

    struct Input {
        let matchId: Driver<String>
    }

    struct Output {
        let section: Driver<[SectionModel<String, ParticipantInfo>]>
        let match: Driver<Match>
    }

    func transform(input: Input) -> Output {
        let matchRelay: PublishRelay<Match> = .init()
        var section: [SectionModel<String, ParticipantInfo>] = []
        let sectionObservable: PublishRelay<[SectionModel<String, ParticipantInfo>]> = .init()

        input.matchId
            .flatMapLatest { matchId -> Driver<Match> in
                return network.getMatch(matchId: matchId)
            }
            .asDriver(onErrorDriveWith: .never())
            .drive(onNext: { match in
                matchRelay.accept(match)

                match.info.participants.forEach { participant in
                    let name = participant.championName
                    let level = "\(participant.champLevel)"
                    let kda =  String(format: "%.1f", participant.challenges.kda)
                    section.append(SectionModel(model: participant.summonerName, items: [.champion(name), .level(level), .kda(kda)]))
                }
                sectionObservable.accept(section)
            })
            .disposed(by: disposeBag)

        return Output(section: sectionObservable.asDriver(onErrorDriveWith: .never()), match: matchRelay.asDriver(onErrorDriveWith: .never()))
    }
}
