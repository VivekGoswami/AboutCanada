//
//  AboutCanadaViewModel.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/7/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

class AboutCanadaViewModel : NSObject {

    private var networking : Networking?
    private(set) var record : AboutCanada? {
        didSet {
            self.bindAboutCanadaViewModelToController()
        }
    }
    var bindAboutCanadaViewModelToController : (() -> Void) = {}
    
    override init() {
        super.init()
        self.networking =  Networking()
        self.getRecords()
    }
    func getRecords() {
        self.networking?.requestObject(.aboutCanada, completion: { (record : AboutCanada) in
            self.record = record
        })
    }
}
