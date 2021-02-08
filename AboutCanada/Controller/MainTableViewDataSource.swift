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
class MainTableViewDataSource<CELL : UITableViewCell,Rows> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String
    private var items : [Rows]!
    var configureCell : (CELL, Rows) -> Void = {_,_ in }
    
    /// Datasource for tableview with generic cell and model object pass on call
    ///
    /// - Parameter cellIdentifier: type of cell
    /// - Parameter items: array of records
    /// - Parameter configureCell: closure block for return with cell and record
    /// - Returns: cell and record in closure block
    ///
    init(cellIdentifier : String, items : [Rows], configureCell : @escaping (CELL, Rows) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
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
        cell.layoutIfNeeded()
        return cell
    }
}
