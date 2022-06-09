//
//  ChampionCell.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/08.
//

import UIKit

final class ChampionCell: UICollectionViewCell {

    let championImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - function

    private func setView() {

        contentView.addSubview(championImageView)

        championImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        championImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        championImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        championImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
}
