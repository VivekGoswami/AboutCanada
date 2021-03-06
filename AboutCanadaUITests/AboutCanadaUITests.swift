//
//  AboutCanadaUITests.swift
//  AboutCanadaUITests
//
//  Created by Vivek Goswami on 2/10/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import XCTest

class AboutCanadaUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    func test_viewDidLoad_renderData() {
        let app = XCUIApplication()
        let reloadButton = app.navigationBars["About Canada"].buttons["Reload"]
        reloadButton.tap()
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier: "Flag").element.tap()
    }
    override func setUp() {
        super.setUp()
        XCUIApplication().launch()
    }
}
