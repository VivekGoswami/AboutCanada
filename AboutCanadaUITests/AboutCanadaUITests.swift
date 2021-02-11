//
//  AboutCanadaUITests.swift
//  AboutCanadaUITests
//
//  Created by Vivek Goswami on 2/10/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import XCTest
@testable import AboutCanada

class AboutCanadaUITests: XCTestCase {

    var dataSource: MainTableViewDataSource<AboutCell, Rows>?
    var viewControllerUnderTest = MainViewController()
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
    override func setUp() {
        super.setUp()
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }
    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.tableView)
    }
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.tableView.delegate)
    }
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
    }
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.tableView.dataSource)
    }
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(dataSource?.numberOfSections(in:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(dataSource?.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(dataSource?.tableView(_:cellForRowAt:))))
    }
    func testTableViewCellHasReuseIdentifier() {
        let tableview = viewControllerUnderTest.tableView
        let cell = dataSource?.tableView(tableview, cellForRowAt: IndexPath(row: 0, section: 0)) as? AboutCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "AboutCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    func testTableCellHasCorrectLabelText() {
        let tableview = viewControllerUnderTest.tableView
        let cell0 = dataSource?.tableView(tableview, cellForRowAt: IndexPath(row: 0, section: 0)) as? AboutCell
        XCTAssertEqual(cell0?.titleLabel.text, "one")
        let cell1 = dataSource?.tableView(tableview, cellForRowAt: IndexPath(row: 1, section: 0)) as? AboutCell
        XCTAssertEqual(cell1?.titleLabel.text, "two")
        let cell2 = dataSource?.tableView(tableview, cellForRowAt: IndexPath(row: 2, section: 0)) as? AboutCell
        XCTAssertEqual(cell2?.titleLabel.text, "three")
    }
}
