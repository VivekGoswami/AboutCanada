//
//  MainViewController+UITableView.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/6/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

extension MainViewController : UITableViewDataSource, UITableViewDelegate {

    // MARK: - Table View Data Source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            AboutCell.identifier, for: indexPath) as? AboutCell else {
                return UITableViewCell()
        }
        return cell
    }
    // MARK: - Table View Delegate methods
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
}
