//
//  AllAnalyticsTests.swift
//  AllAnalyticsTests
//
//  Created by Julien Saito on 6/21/17.
//  Copyright © 2017 otiasj. All rights reserved.
//

import XCTest
@testable import AllAnalytics

class AllAnalyticsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        AllAnalytics.newEvent(name: "hello").with(data: ["someKey" : "someValue", "another Key" : 42]).to(AnalyticTarget.all).send()
    }
    
}
