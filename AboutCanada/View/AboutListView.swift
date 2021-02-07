//
//  AboutListView.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/5/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

class AboutListView: UIView {
        
    var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        return view
    }()
    var recordsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.identifier)

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50

        tableView.tableFooterView = UIView(frame: .zero)        
        tableView.allowsSelection = false
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setTopView()
        setTableView()
    }
    private func setTopView() {
        addSubview(topView)
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
    }

    private func setTableView() {
        addSubview(recordsTableView)
        recordsTableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        recordsTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        recordsTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        recordsTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setTableViewDataSourceDelegate <Obj: UITableViewDataSource & UITableViewDelegate> (
        dataSourceDelegate: Obj) {
        recordsTableView.dataSource = dataSourceDelegate
        recordsTableView.delegate = dataSourceDelegate
        recordsTableView.reloadAsync()
    }    
}
