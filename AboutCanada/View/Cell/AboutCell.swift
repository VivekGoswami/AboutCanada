//
//  AboutCell.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/5/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell {

    private var aboutImageView: UIImageView = AboutImageView()
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    //Specify method or properties which you want to load when cell create
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setTitleLabel()
        setDescriptionLabel()
        setImageView()
        setupViewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:- Title Properties
    private func setTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK:- Description Properties
    private func setDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.textAlignment = .left
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK:- ImageView Properties
    /* Imageview use as custom imageview you can set option in AboutImageView class */
    
    private func setImageView() {
        aboutImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aboutImageView)
    }
    func setupViewsConstraints() {
        // setup views constraints
        let marginGuide = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([

            // ImageView
            aboutImageView.widthAnchor.constraint(equalToConstant: 100),
            aboutImageView.heightAnchor.constraint(equalToConstant: 100),
            aboutImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            aboutImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor),

            // Title
            titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: aboutImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),

            // Description
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: aboutImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: marginGuide.bottomAnchor),
        ])
    }
}
