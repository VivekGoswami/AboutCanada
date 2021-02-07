//
//  Networking.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/7/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit
import Moya
import Moya_ObjectMapper
import ObjectMapper
import SVProgressHUD

typealias SuccessHandler<T: Mappable> = ((T) -> Void)
typealias FailureHandler = ((Int?, String?) -> Void)

/**
 Networking manager for API request with single or list object
 
 - parameter target: Pass service name with dot syntax.
 - returns: Response with generic model so you can convert into passed model type
 - warning: nil
 
 
 # Notes: #
 1. For single object Use requestObject method for Array or list of objects use requestList
 
 # Example #
 ```
 Networking.requestObject(.aboutCanada)
 ```
 
 */
class Networking :  NSObject {
    func requestObject<T: Mappable>(_ target: Services, completion: SuccessHandler<T>? = nil, ErrorBlock errorBlock : FailureHandler? = nil) {
        
        if !NetworkListner.shared.isReachable {
            SVProgressHUD.showError(withStatus:Network.Message.unavailable)
            return
        }
        DispatchQueue.main.async {
            SVProgressHUD.show()
            SVProgressHUD.setDefaultMaskType(.gradient)
        }
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    sleep(1)
                    SVProgressHUD.dismiss()
                }
                do {
                    let stringToISOLatin = String(data: response.data, encoding: .isoLatin1)
                    guard let dataUTF8 = stringToISOLatin?.data(using: String.Encoding.utf8) else {
                        return
                    }
                    let convertedResponse = Response(statusCode: response.statusCode, data: dataUTF8)
                    if let keyPath = target.keyPath {
                        let json = try convertedResponse.mapObject(T.self, atKeyPath: keyPath)
                        completion?(json)
                    } else {
                        let json = try convertedResponse.mapObject(T.self)
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
