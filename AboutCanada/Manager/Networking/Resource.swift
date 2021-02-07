//
//  Networking.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/5/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit
import SVProgressHUD

/**
 BASE URL of app with selection Production and Development
 
 - parameter nil: nil.
 - returns: stringURL
 - warning:
 
 
 # Notes: #
 1. If you want to change environment from AppDelegate when deploy
 
 # Example #
 ```
 AppManager.shared.appStatus = .development
 ```
 
 */
var baseURL : String {
    if AppManager.shared.appStatus == .production {
        return API.productionURL // Live
    }
    return API.developmentURL // Development
}
struct App {
    struct String {
        struct BaseURL {
            static let url = baseURL
        }
    }
}
