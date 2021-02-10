//
//  AboutImageView.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/7/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

class AboutImageView: UIImageView {

    /// Imageview property set Border, Shadow, content mode
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10.0

        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
