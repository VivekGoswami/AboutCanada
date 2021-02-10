//
//  AboutCanadaViewModel.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/7/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

class AboutCanadaViewModel: NSObject {

    private var networking: Networking?
    private(set) var record: AboutCanada? {
        didSet {
            self.bindAboutCanadaViewModelToController()
        }
    }
    /// Closure when API request complete and data bind into tableview
    var bindAboutCanadaViewModelToController : (() -> Void) = {}
    override init() {
        super.init()
        self.networking =  Networking()
        self.getRecords()
    }
    /// API request for get record from server
    ///
    /// - Parameter value: nil
    /// - Returns: nil
    ///
    func getRecords() {
        self.networking?.requestObject(.aboutCanada, completion: { (records: AboutCanada) in
            self.manageBlankRecords(records: records)
        })
    }
    /// Manage server reponse to remove blank or nil records from array.
    ///
    /// - Parameter value: record
    /// - Returns: nil
    ///
    private func manageBlankRecords(records: AboutCanada) {
        do {
            let filter = try records.rows?.filter {
                try $0.toDictionary().count != 0
            }
            let title = records.title
            let canadaRecord = AboutCanada()
            canadaRecord.title = title
            canadaRecord.rows = filter
            self.record = canadaRecord
        } catch {
            print(error)
        }
    }
}
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
