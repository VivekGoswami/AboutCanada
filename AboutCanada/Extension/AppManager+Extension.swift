//
//  AppManager+Extension.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/11/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit
import SVProgressHUD

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
