//
//  AppManager.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/5/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit
import SVProgressHUD
/**
 App Environment for Webservices
 
 - parameter int: Select enviroment with dot syntax.
 - returns: type of enviroment
 - warning: nil
 
 
 # Notes: #
 1. Change if you want to deploy
 
 # Example #
 ```
 ```
 
 */
enum AppStatusType: Int {
    case development
    case production
}
final class AppManager: NSObject {
    static let shared = AppManager()
    var appStatus: AppStatusType = .development
    // MARK: - Members
    override init() {
        super.init()
    }
}
extension AppManager {
    // MARK: - Listener for network connection
    func startNeworkNotifier() {
        NetworkListner.shared.startNotifier()
        NetworkListner.shared.reachabilityObserver = { status in
            switch status {
            case .connected:
                break
            case .disconnected:
                SVProgressHUD.showError(withStatus: Network.Message.unavailable)
            }
        }
    }
}
