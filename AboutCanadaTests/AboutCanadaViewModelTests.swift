//
//  AboutCanadaViewModelTests.swift
//  AboutCanadaTests
//
//  Created by Vivek Goswami on 2/8/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import XCTest
@testable import AboutCanada

class AboutCanadaViewModelTests: XCTestCase {

    var mockAPIService : Networking?
    var sut : AboutCanadaViewModel?
    
    override func setUp() {
        super.setUp()
        
        sut = AboutCanadaViewModel()
        mockAPIService = Networking()
    }
    override func tearDown() {
        mockAPIService = nil
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_record(){
        
        let expect = XCTestExpectation(description: "callback")
        
        let request : Services = .aboutCanada
        mockAPIService?.requestObject(request, completion: { (records: AboutCanada) in
            expect.fulfill()
            XCTAssertEqual( records.rows?.count, 14)
        })
        wait(for: [expect], timeout: 3.1)
    }
    func test_cell_view_model() {
        //Given photos
        
        let rowWithData = Rows()
        rowWithData.title = "Demo"
        rowWithData.description = "Description will come here"
        rowWithData.imageHref = "http://static.guim.co.uk/sys-images/Music/Pix/site_furniture/2007/04/19/avril_lavigne.jpg"
        
        let rowWithoutDescription = Rows()
        rowWithoutDescription.title = "Demo"
        rowWithoutDescription.description = nil
        rowWithoutDescription.imageHref = "http://static.guim.co.uk/sys-images/Music/Pix/site_furniture/2007/04/19/avril_lavigne.jpg"
        
        let rowWithoutTitle = Rows()
        rowWithoutTitle.title = nil
        rowWithoutTitle.description = "Test message"
        rowWithoutTitle.imageHref = "http://static.guim.co.uk/sys-images/Music/Pix/site_furniture/2007/04/19/avril_lavigne.jpg"
        
        let rowWithoutData = Rows()
        rowWithoutData.title = nil
        rowWithoutData.description = nil
        rowWithoutData.imageHref = nil
        
        let cellViewModelWithoutDesc = sut?.record?.rows?.first
        let cellViewModelWithoutTitle = sut?.record?.rows?.first
        let cellViewModelWithoutData = sut?.record?.rows?.first
        
        XCTAssertEqual(cellViewModelWithoutDesc?.description, rowWithoutDescription.description )
        XCTAssertEqual(cellViewModelWithoutTitle?.title, rowWithoutTitle.title )
        XCTAssertEqual(cellViewModelWithoutData?.imageHref, nil)
    }
}
