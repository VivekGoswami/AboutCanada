//
//  Codable+Extension.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/11/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

extension Encodable {

    /// Converting object to postable dictionary
    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(codingPath: [], debugDescription: Error.Message.deserialized)
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json
    }
}
