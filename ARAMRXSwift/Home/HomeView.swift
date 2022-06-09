//
//  HomeView.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/04/26.
//

import UIKit

final class HomeView: UIView {

    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "NAME: "
        label.backgroundColor = .cyan
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let summonerLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "LEVEL: "
        label.backgroundColor = .cyan
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let rankLabel: UILabel = {
        let label = UILabel()
        label.text = "RANK: "
        label.backgroundColor = .cyan
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let pointLabel: UILabel = {
        let label = UILabel()
        label.text = "POINTS: "
        label.backgroundColor = .cyan
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {

        translatesAutoresizingMaskIntoConstraints = false

        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(summonerLevelLabel)
        addSubview(rankLabel)
        addSubview(pointLabel)
        addSubview(tableView)

        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        summonerLevelLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
        summonerLevelLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        summonerLevelLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        summonerLevelLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        rankLabel.topAnchor.constraint(equalTo: summonerLevelLabel.bottomAnchor, constant: 16).isActive = true
        rankLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rankLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        rankLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        pointLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor, constant: 16).isActive = true
        pointLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        pointLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        pointLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        tableView.topAnchor.constraint(equalTo: pointLabel.bottomAnchor, constant: 16).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
