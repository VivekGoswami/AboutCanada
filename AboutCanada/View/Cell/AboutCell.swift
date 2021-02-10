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

    var item: Rows? {
        didSet {
            self.setRecord()
        }
    }
    private var aboutImageView: UIImageView = AboutImageView()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    /// Specify method or properties which you want to load when cell create
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
    }
    // MARK: - Description Properties
    private func setDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.textAlignment = .left
    }
    // MARK: - ImageView Properties
    /// Imageview use as custom imageview you can set option in AboutImageView class
    private func setImageView() {
        contentView.addSubview(aboutImageView)
        aboutImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    /// Constraint of cell set from here
    /// Contenthugging priority added in description lable high for manage cell size based on content
    /// Imageview size fixed give priority low
    ///
    /// - Parameter value: nil
    /// - Returns: nil
    ///
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            aboutImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            aboutImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            aboutImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            .withPriority(priority: .defaultLow),
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
    /// Item object set from datasource value will be set here
    ///
    /// - Parameter value: nil
    /// - Returns: nil
    ///
    private func setRecord() {
        self.titleLabel.text = self.item?.title
        self.descriptionLabel.text = self.item?.description
        /// Layout will be updated when set content of lable
        setNeedsLayout()
    }
    func imageLoad() {
        if let strURL = self.item?.photoUrl, let url = URL(string: strURL) {
            let placeholderImage = UIImage(named: Image.placeholder)
            self.aboutImageView.sd_setImage(with: url, placeholderImage: placeholderImage, options: .refreshCached)
        } else {
            /// Image load from URL when it's not available default image will be show
            self.aboutImageView.image = UIImage(named: Image.placeholder)
        }
        /// Layout will be updated when set image and content of lable
        setNeedsLayout()
    }
}
