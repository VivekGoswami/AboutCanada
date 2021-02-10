//
//  MainViewController.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/5/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var viewModel: AboutCanadaViewModel = {
        return AboutCanadaViewModel()
    }()
    private var dataSource: MainTableViewDataSource<AboutCell, Rows>?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.identifier)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tableViewContstraint()
        self.callToViewModelForUIUpdate()
    }
    /// Data binding on tableview by calling API request
    private func callToViewModelForUIUpdate() {
        self.viewModel.bindAboutCanadaViewModelToController = {
            self.updateDataSource()
        }
    }
    /// Datasource will update and generate cell by items
    private func updateDataSource() {
        guard let rows = self.viewModel.record?.rows else { return }
        let identifier = AboutCell.identifier
        self.dataSource = MainTableViewDataSource(identifier: identifier, items: rows, configureCell: { (cell, item) in
            cell.item = item
        })
        DispatchQueue.main.async {
            /// Title will be set after API response set in ViewModel
            self.title = self.viewModel.record?.title
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self.dataSource
            self.tableView.reloadAsync()
        }
    }
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)
        let leftButton =  UIBarButtonItem()
        leftButton.title = BarButton.Title.reload
        leftButton.style = .plain
        leftButton.target = self
        leftButton.action = #selector(self.refreshTableData)
        self.navigationItem.rightBarButtonItem = leftButton
    }
    /// Constraint set for tablview on screen
    private func tableViewContstraint() {
        self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
extension MainViewController {
    // MARK: - Refresh content
    @IBAction func refreshTableData() {
        self.viewModel.getRecords()
    }
}
