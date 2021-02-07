//
//  UITableView+Extension.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/5/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

extension UITableViewCell {
    @objc class var identifier: String {
        return String(describing: self)
    }
}
extension UITableView {
    func reloadAsync() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
