//
//  MainViewController.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/5/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let leftButton =  UIBarButtonItem(title: BarButton.title.reload, style:.plain, target: self, action: #selector(self.reloadTableData))
        navigationItem.rightBarButtonItem = leftButton
        view = AboutListView()
        initViewModel()
        initView()
    }
    private func initView() {
        view = AboutListView()
        (view as! AboutListView).setTableViewDataSourceDelegate(dataSourceDelegate: self)
    }
    private func initViewModel() {
        DispatchQueue.main.async { [weak self] in
            (self?.view as! AboutListView).recordsTableView.reloadData()
        }
    }
}
extension MainViewController {
    //MARK:- Refresh content
    @IBAction func reloadTableData() {
        debugPrint(#function)
    }
}
