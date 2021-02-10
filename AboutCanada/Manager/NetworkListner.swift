//
//  NetworkListner.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/7/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit
import Reachability

final class NetworkListner {
    enum ReachabilityStatus: Equatable {
        case connected
        case disconnected
    }
    static let shared = NetworkListner()
    private let reachability = try? Reachability()
    var reachabilityObserver: ((ReachabilityStatus) -> Void)?
    private(set) var reachabilityStatus: ReachabilityStatus = .connected
    private init() {
        setupReachability()
    }
    /// setup observer to detect reachability changes
    private func setupReachability() {
        let reachabilityStatusObserver: ((Reachability) -> Void) = { [unowned self] (reachability: Reachability) in
            self.updateReachabilityStatus(reachability.connection)
        }
        reachability?.whenReachable = reachabilityStatusObserver
        reachability?.whenUnreachable = reachabilityStatusObserver
    }
    /// Start observing reachability changes
    func startNotifier() {
        do {
            try reachability?.startNotifier()
        } catch {
            print(error.localizedDescription)
        }
    }
    /// Stop observing reachability changes
    func stopNotifier() {
        reachability?.stopNotifier()
    }
    /// Updated ReachabilityStatus status based on connectivity status
    ///
    /// - Parameter status: Reachability.Connection enum containing reachability status
    private func updateReachabilityStatus(_ status: Reachability.Connection) {
        switch status {
        case .unavailable, .none:
            notifyReachabilityStatus(.disconnected)
        case .cellular, .wifi:
            notifyReachabilityStatus(.connected)
        }
    }
    /// Notifies observers about reachability status change
    ///
    /// - Parameter status: ReachabilityStatus enum indicating status eg. .connected/.disconnected
    private func notifyReachabilityStatus(_ status: ReachabilityStatus) {
        reachabilityStatus = status
        reachabilityObserver?(status)
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: Notification.reachabilityStatusChanged),
            object: nil,
            userInfo: ["ReachabilityStatus": status]
        )
    }
    /// returns current reachability status
    var isReachable: Bool {
        return reachability?.connection != .unavailable
    }
    /// returns if connected via cellular or wifi
    var isConnectedViaCellularOrWifi: Bool {
        return isConnectedViaCellular || isConnectedViaWiFi
    }
    /// returns if connected via cellular
    var isConnectedViaCellular: Bool {
        return reachability?.connection == .cellular
    }
    /// returns if connected via cellular
    var isConnectedViaWiFi: Bool {
        return reachability?.connection == .wifi
    }
    deinit {
        stopNotifier()
    }
}
