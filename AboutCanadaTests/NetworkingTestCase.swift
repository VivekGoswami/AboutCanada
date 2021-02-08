//
//  NetworkingTestCase.swift
//  AboutCanadaTests
//
//  Created by Vivek Goswami on 2/8/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import XCTest
@testable import AboutCanada

class NetworkingTestCase: XCTestCase {

    var networking : Networking?
    
    override func setUp() {
        super.setUp()
        networking = Networking()
    }
    override func tearDown() {
        networking = nil
        super.tearDown()
    }
    func test_fetch_record(){
        
        let expect = XCTestExpectation(description: "callback")
        
        let request : Services = .aboutCanada
        networking?.requestObject(request, completion: { (records: AboutCanada) in
            expect.fulfill()
        })
        wait(for: [expect], timeout: 3.1)
    }
}
