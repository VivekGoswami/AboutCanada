//
//  AboutCell.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/5/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit
import SDWebImage

class AboutCell: UITableViewCell {

    var item : Rows? {
        didSet {
            self.setRecord()
        }
    }
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
    // Specify method or properties which you want to load when cell create
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTitleLabel()
        setDescriptionLabel()
        setImageView()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setTitleLabel()
        setDescriptionLabel()
        setImageView()
        setupConstraints()
    }
    
    // MARK: - Title Properties
    private func setTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Description Properties
    private func setDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.textAlignment = .left
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - ImageView Properties
    /* Imageview use as custom imageview you can set option in AboutImageView class */
    private func setImageView() {
        contentView.addSubview(aboutImageView)
        aboutImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    // setup views constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            aboutImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            aboutImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            aboutImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).withPriority(priority: .defaultLow),
            aboutImageView.widthAnchor.constraint(equalToConstant: 80),
            aboutImageView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: aboutImageView.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: aboutImageView.rightAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        ])
        descriptionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    func setRecord() {
        self.titleLabel.text = self.item?.title
        self.descriptionLabel.text = self.item?.description
        
        if let strURL = self.item?.imageHref,let url = URL(string: strURL) {
            self.aboutImageView.sd_setImage(with: url, placeholderImage:UIImage(named: Image.placeholder), options: .refreshCached)
        } else {
            self.aboutImageView.image = UIImage(named: Image.placeholder)
        }
        setNeedsLayout()
    }
}
