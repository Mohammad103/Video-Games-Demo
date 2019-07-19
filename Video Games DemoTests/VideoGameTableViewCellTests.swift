//
//  VideoGameTableViewCellTests.swift
//  Video Games DemoTests
//
//  Created by Mohammad Shaker on 7/20/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import XCTest
@testable import Video_Games_Demo

class VideoGameTableViewCellTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testInit() {
        let tableView = UITableView()
        tableView.register(VideoGameTableViewCell.self, forCellReuseIdentifier: "VideoGameTableViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoGameTableViewCell", for: IndexPath(row: 0, section: 0)) as? VideoGameTableViewCell
        XCTAssertNotNil(cell)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
}
