//
//  ChampionViewModel.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/07.
//

import Foundation
import RxSwift
import RxCocoa

struct ChampionViewModel: ViewModelType {

    let disposeBag = DisposeBag()

    let network: ChampionNetwork

    init(network: ChampionNetwork = ChampionNetwork()) {
        self.network = network
    }
    
    struct Input {

    }

    struct Output {
        let champion: Driver<[ChampionInfo]>
    }

    func transform(input: Input) -> Output {
        var champions: [ChampionInfo] = []
        let championRelay: PublishRelay<[ChampionInfo]> = .init()
        network.getChampions()
            .map { champion in
                // MARK: - A
                champions.append(champion.data.Aatrox)
                champions.append(champion.data.Ahri)
                champions.append(champion.data.Akali)
                champions.append(champion.data.Akshan)
                champions.append(champion.data.Alistar)
                champions.append(champion.data.Amumu)
                champions.append(champion.data.Anivia)
                champions.append(champion.data.Annie)
                champions.append(champion.data.Aphelios)
                champions.append(champion.data.Ashe)
                champions.append(champion.data.AurelionSol)
                champions.append(champion.data.Azir)

                // MARK: - B
                champions.append(champion.data.Bard)
                champions.append(champion.data.Belveth)
                champions.append(champion.data.Blitzcrank)
                champions.append(champion.data.Brand)
                champions.append(champion.data.Braum)

                // MARK: - C
                champions.append(champion.data.Caitlyn)
                champions.append(champion.data.Camille)
                champions.append(champion.data.Cassiopeia)
                champions.append(champion.data.Chogath)
                champions.append(champion.data.Corki)

                // MARK: - D
                champions.append(champion.data.Darius)
                champions.append(champion.data.Diana)
                champions.append(champion.data.Draven)
                champions.append(champion.data.DrMundo)

                // MARK: - E
                champions.append(champion.data.Ekko)
                champions.append(champion.data.Elise)
                champions.append(champion.data.Evelynn)
                champions.append(champion.data.Ezreal)

                // MARK: - F
                champions.append(champion.data.Fiddlesticks)
                champions.append(champion.data.Fiora)
                champions.append(champion.data.Fizz)

                // MARK: - G
                champions.append(champion.data.Galio)
                champions.append(champion.data.Gangplank)
                champions.append(champion.data.Garen)
                champions.append(champion.data.Gnar)
                champions.append(champion.data.Gragas)
                champions.append(champion.data.Gwen)

                // MARK: - H
                champions.append(champion.data.Hecarim)
                champions.append(champion.data.Heimerdinger)

                // MARK: - I
                champions.append(champion.data.Illaoi)
                champions.append(champion.data.Irelia)
                champions.append(champion.data.Ivern)

                // MARK: - J
                champions.append(champion.data.Janna)
                champions.append(champion.data.JarvanIV)
                champions.append(champion.data.Jax)
                champions.append(champion.data.Jayce)
                champions.append(champion.data.Jhin)
                champions.append(champion.data.Jinx)

                // MARK: - K
                champions.append(champion.data.Kaisa)
                champions.append(champion.data.Kalista)
                champions.append(champion.data.Karma)
                champions.append(champion.data.Karthus)
                champions.append(champion.data.Kassadin)
                champions.append(champion.data.Katarina)
                champions.append(champion.data.Kayle)
                champions.append(champion.data.Kayn)
                champions.append(champion.data.Kennen)
                champions.append(champion.data.Khazix)
                champions.append(champion.data.Kindred)
                champions.append(champion.data.Kled)
                champions.append(champion.data.KogMaw)

                // MARK: - L
                champions.append(champion.data.Leblanc)
                champions.append(champion.data.LeeSin)
                champions.append(champion.data.Leona)
                champions.append(champion.data.Lillia)
                champions.append(champion.data.Lissandra)
                champions.append(champion.data.Lucian)
                champions.append(champion.data.Lulu)
                champions.append(champion.data.Lux)

                // MARK: - M
                champions.append(champion.data.Malphite)
                champions.append(champion.data.Malzahar)
                champions.append(champion.data.Maokai)
                champions.append(champion.data.MasterYi)
                champions.append(champion.data.MissFortune)
                champions.append(champion.data.MonkeyKing)
                champions.append(champion.data.Mordekaiser)
                champions.append(champion.data.Morgana)

                // MARK: - N
                champions.append(champion.data.Nami)
                champions.append(champion.data.Nasus)
                champions.append(champion.data.Nautilus)
                champions.append(champion.data.Neeko)
                champions.append(champion.data.Nidalee)
                champions.append(champion.data.Nocturne)
                champions.append(champion.data.Nunu)

                // MARK: - O
                champions.append(champion.data.Olaf)
                champions.append(champion.data.Orianna)
                champions.append(champion.data.Ornn)

                // MARK: - P
                champions.append(champion.data.Pantheon)
                champions.append(champion.data.Poppy)
                champions.append(champion.data.Pyke)

                // MARK: - Q
                champions.append(champion.data.Qiyana)
                champions.append(champion.data.Quinn)

                // MARK: - R
                champions.append(champion.data.Rakan)
                champions.append(champion.data.Rammus)
                champions.append(champion.data.RekSai)
                champions.append(champion.data.Rell)
                champions.append(champion.data.Renata)
                champions.append(champion.data.Renekton)
                champions.append(champion.data.Rengar)
                champions.append(champion.data.Riven)
                champions.append(champion.data.Rumble)
                champions.append(champion.data.Ryze)

                // MARK: - S
                champions.append(champion.data.Samira)
                champions.append(champion.data.Sejuani)
                champions.append(champion.data.Senna)
                champions.append(champion.data.Seraphine)
                champions.append(champion.data.Sett)
                champions.append(champion.data.Shaco)
                champions.append(champion.data.Shen)
                champions.append(champion.data.Shyvana)
                champions.append(champion.data.Singed)
                champions.append(champion.data.Sion)
                champions.append(champion.data.Sivir)
                champions.append(champion.data.Skarner)
                champions.append(champion.data.Sona)
                champions.append(champion.data.Soraka)
                champions.append(champion.data.Swain)
                champions.append(champion.data.Sylas)
                champions.append(champion.data.Syndra)

                // MARK: - T
                champions.append(champion.data.TahmKench)
                champions.append(champion.data.Taliyah)
                champions.append(champion.data.Talon)
                champions.append(champion.data.Taric)
                champions.append(champion.data.Teemo)
                champions.append(champion.data.Thresh)
                champions.append(champion.data.Tristana)
                champions.append(champion.data.Trundle)
                champions.append(champion.data.Tryndamere)
                champions.append(champion.data.TwistedFate)
                champions.append(champion.data.Twitch)

                // MARK: - U
                champions.append(champion.data.Udyr)
                champions.append(champion.data.Urgot)

                // MARK: - V
                champions.append(champion.data.Varus)
                champions.append(champion.data.Vayne)
                champions.append(champion.data.Veigar)
                champions.append(champion.data.Velkoz)
                champions.append(champion.data.Vex)
                champions.append(champion.data.Vi)
                champions.append(champion.data.Viego)
                champions.append(champion.data.Viktor)
                champions.append(champion.data.Vladimir)
                champions.append(champion.data.Volibear)

                // MARK: - W
                champions.append(champion.data.Warwick)

                // MARK: - X
                champions.append(champion.data.Xayah)
                champions.append(champion.data.Xerath)
                champions.append(champion.data.XinZhao)

                // MARK: - Y
                champions.append(champion.data.Yasuo)
                champions.append(champion.data.Yone)
                champions.append(champion.data.Yorick)
                champions.append(champion.data.Yuumi)

                // MARK: - Z
                champions.append(champion.data.Zac)
                champions.append(champion.data.Zed)
                champions.append(champion.data.Zeri)
                champions.append(champion.data.Ziggs)
                champions.append(champion.data.Zilean)
                champions.append(champion.data.Zoe)
                champions.append(champion.data.Zyra)

                return champions
            }
            .compactMap { championRelay.accept($0) }
            .drive()
            .disposed(by: disposeBag)
        return Output(champion: championRelay.asDriver(onErrorDriveWith: .never()))
    }
}
