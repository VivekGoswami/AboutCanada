//
//  Networking.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/7/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit
import Moya
import SVProgressHUD

typealias Success<T: Codable> = ((T) -> Void)
typealias Failure = ((Int?, String?) -> Void)

/**
 Networking manager for API request with single object
 
 - parameter target: Pass service name with dot syntax.
 - returns: Response with generic model so you can convert into passed model type
 - warning: nil
 
 
 # Notes: #
 1. For single object Use requestObject method
 
 # Example #
 ```
 Networking.requestObject(.aboutCanada)
 ```
 
 */
class Networking: NSObject {
    func requestObject<T: Codable>(_ target: Services, completion: Success<T>? = nil, errorBlock: Failure? = nil) {
        if !NetworkListner.shared.isReachable {
            SVProgressHUD.showError(withStatus: Network.Message.unavailable)
            return
        }
        DispatchQueue.main.async {
            SVProgressHUD.show()
            SVProgressHUD.setDefaultMaskType(.clear)
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        provider.request(target) { (result) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                SVProgressHUD.dismiss()
            })
            switch result {
            case .success(let response):
                do {
                    let stringToISOLatin = String(data: response.data, encoding: .isoLatin1)
                    guard let dataUTF8 = stringToISOLatin?.data(using: String.Encoding.utf8) else {
                        return
                    }
                    let convertedResponse = Response(statusCode: response.statusCode, data: dataUTF8)
                    /// Keypath will be set from Services for reponse object which needs to be parsed
                    if let keyPath = target.keyPath {
                        let json = try convertedResponse.map(T.self, atKeyPath: keyPath)
                        completion?(json)
                    } else {
                        let json = try convertedResponse.map(T.self)
                        completion?(json)
                    }
                } catch {
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                        let error = error as NSError
                        SVProgressHUD.showError(withStatus: error.localizedDescription)
                        errorBlock?(error.code, error.localizedDescription)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    SVProgressHUD.showError(withStatus: error.localizedDescription)
                    errorBlock?(error.errorCode, error.errorDescription)
                }
            }
        }
    }
}
