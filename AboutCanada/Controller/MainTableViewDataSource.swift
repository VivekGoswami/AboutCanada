//
//  MainTableViewDataSource.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/6/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit
/// Datasource for tableview with generic cell and model object pass on call
///
/// - Parameter CELL: type of cell
/// - Returns: nil
///
class MainTableViewDataSource<CELL: UITableViewCell, Rows>: NSObject, UITableViewDataSource, UITableViewDelegate {
    fileprivate var cellHeights: [Int: [Int: CGFloat]] = [:]
    private var cellIdentifier: String
    private var items: [Rows]!
    var configureCell: (CELL, Rows) -> Void = {_, _ in }
    /// Datasource for tableview with generic cell and model object pass on call
    ///
    /// - Parameter cellIdentifier: type of cell
    /// - Parameter items: array of records
    /// - Parameter configureCell: closure block for return with cell and record
    /// - Returns: cell and record in closure block
    ///
    init(identifier: String, items: [Rows], configureCell : @escaping (CELL, Rows) -> Void) {
        self.cellIdentifier = identifier
        self.items =  items
        self.configureCell = configureCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CELL else {
            return UITableViewCell()
        }
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let sectionCell = cell as? AboutCell else { return }
        sectionCell.imageLoad()
    }
}
