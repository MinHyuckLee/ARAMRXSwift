//
//  ChampionDetailCell.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/09.
//

import UIKit

final class ChampionDetailCell: UITableViewCell {

    let championImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let championTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championLoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let allyTipsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let enemyTipsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championSpellPassiveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let championSpellPassiveNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championSpellPassiveDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championSpellQImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let championSpellQNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championSpellQDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championSpellWImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let championSpellWNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championSpellWDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championSpellEImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let championSpellENameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championSpellEDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championSpellRImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let championSpellRNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let championSpellRDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - init()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - function

    private func setView() {
        selectionStyle = .none

        contentView.addSubview(championImageView)
        contentView.addSubview(championTitleLabel)
        contentView.addSubview(championNameLabel)
        contentView.addSubview(championLoreLabel)

        contentView.addSubview(championSpellPassiveImageView)
        contentView.addSubview(championSpellPassiveNameLabel)
        contentView.addSubview(championSpellPassiveDescriptionLabel)

        contentView.addSubview(championSpellQImageView)
        contentView.addSubview(championSpellQNameLabel)
        contentView.addSubview(championSpellQDescriptionLabel)

        contentView.addSubview(championSpellWImageView)
        contentView.addSubview(championSpellWNameLabel)
        contentView.addSubview(championSpellWDescriptionLabel)

        contentView.addSubview(championSpellEImageView)
        contentView.addSubview(championSpellENameLabel)
        contentView.addSubview(championSpellEDescriptionLabel)

        contentView.addSubview(championSpellRImageView)
        contentView.addSubview(championSpellRNameLabel)
        contentView.addSubview(championSpellRDescriptionLabel)

        contentView.addSubview(allyTipsLabel)
        contentView.addSubview(enemyTipsLabel)

        championImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        championImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        championImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        championImageView.heightAnchor.constraint(equalToConstant: 200 * 1.82).isActive = true

        championTitleLabel.topAnchor.constraint(equalTo: championImageView.bottomAnchor, constant: 16).isActive = true
        championTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        championTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        championNameLabel.topAnchor.constraint(equalTo: championTitleLabel.bottomAnchor, constant: 16).isActive = true
        championNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        championNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        championLoreLabel.topAnchor.constraint(equalTo: championNameLabel.bottomAnchor, constant: 16).isActive = true
        championLoreLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        championLoreLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championLoreLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true

        championSpellPassiveImageView.topAnchor.constraint(equalTo: championLoreLabel.bottomAnchor, constant: 16).isActive = true
        championSpellPassiveImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        championSpellPassiveImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        championSpellPassiveImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true

        championSpellPassiveNameLabel.topAnchor.constraint(equalTo: championLoreLabel.bottomAnchor, constant: 16).isActive = true
        championSpellPassiveNameLabel.leftAnchor.constraint(equalTo: championSpellPassiveImageView.rightAnchor, constant: 16).isActive = true
        championSpellPassiveNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championSpellPassiveNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        championSpellPassiveDescriptionLabel.topAnchor.constraint(equalTo: championSpellPassiveNameLabel.bottomAnchor, constant: 2).isActive = true
        championSpellPassiveDescriptionLabel.leftAnchor.constraint(equalTo: championSpellPassiveImageView.rightAnchor, constant: 16).isActive = true
        championSpellPassiveDescriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championSpellPassiveDescriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true

        championSpellQImageView.topAnchor.constraint(equalTo: championSpellPassiveDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        championSpellQImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        championSpellQImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        championSpellQImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true

        championSpellQNameLabel.topAnchor.constraint(equalTo: championSpellPassiveDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        championSpellQNameLabel.leftAnchor.constraint(equalTo: championSpellQImageView.rightAnchor, constant: 16).isActive = true
        championSpellQNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championSpellQNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        championSpellQDescriptionLabel.topAnchor.constraint(equalTo: championSpellQNameLabel.bottomAnchor, constant: 2).isActive = true
        championSpellQDescriptionLabel.leftAnchor.constraint(equalTo: championSpellQImageView.rightAnchor, constant: 16).isActive = true
        championSpellQDescriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championSpellQDescriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true

        championSpellWImageView.topAnchor.constraint(equalTo: championSpellQDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        championSpellWImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        championSpellWImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        championSpellWImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true

        championSpellWNameLabel.topAnchor.constraint(equalTo: championSpellQDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        championSpellWNameLabel.leftAnchor.constraint(equalTo: championSpellWImageView.rightAnchor, constant: 16).isActive = true
        championSpellWNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championSpellWNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        championSpellWDescriptionLabel.topAnchor.constraint(equalTo: championSpellWNameLabel.bottomAnchor, constant: 2).isActive = true
        championSpellWDescriptionLabel.leftAnchor.constraint(equalTo: championSpellWImageView.rightAnchor, constant: 16).isActive = true
        championSpellWDescriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championSpellWDescriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true

        championSpellEImageView.topAnchor.constraint(equalTo: championSpellWDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        championSpellEImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        championSpellEImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        championSpellEImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true

        championSpellENameLabel.topAnchor.constraint(equalTo: championSpellWDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        championSpellENameLabel.leftAnchor.constraint(equalTo: championSpellEImageView.rightAnchor, constant: 16).isActive = true
        championSpellENameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championSpellENameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        championSpellEDescriptionLabel.topAnchor.constraint(equalTo: championSpellENameLabel.bottomAnchor, constant: 2).isActive = true
        championSpellEDescriptionLabel.leftAnchor.constraint(equalTo: championSpellEImageView.rightAnchor, constant: 16).isActive = true
        championSpellEDescriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championSpellEDescriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true

        championSpellRImageView.topAnchor.constraint(equalTo: championSpellEDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        championSpellRImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        championSpellRImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        championSpellRImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true

        championSpellRNameLabel.topAnchor.constraint(equalTo: championSpellEDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        championSpellRNameLabel.leftAnchor.constraint(equalTo: championSpellRImageView.rightAnchor, constant: 16).isActive = true
        championSpellRNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championSpellRNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        championSpellRDescriptionLabel.topAnchor.constraint(equalTo: championSpellRNameLabel.bottomAnchor, constant: 2).isActive = true
        championSpellRDescriptionLabel.leftAnchor.constraint(equalTo: championSpellRImageView.rightAnchor, constant: 16).isActive = true
        championSpellRDescriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        championSpellRDescriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true

        allyTipsLabel.topAnchor.constraint(equalTo: championSpellRDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        allyTipsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        allyTipsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        allyTipsLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true

        enemyTipsLabel.topAnchor.constraint(equalTo: allyTipsLabel.bottomAnchor).isActive = true
        enemyTipsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        enemyTipsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        enemyTipsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        enemyTipsLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
    }
}
