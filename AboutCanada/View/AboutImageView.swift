//
//  AboutImageView.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/7/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

class AboutImageView: UIImageView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10.0
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowOpacity = 0.5

        contentMode = .scaleAspectFill
        clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
