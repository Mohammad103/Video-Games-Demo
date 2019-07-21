//
//  VideoGamesViewControllerTests.swift
//  Video Games DemoTests
//
//  Created by Mohammad Shaker on 7/20/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import XCTest
@testable import Video_Games_Demo

class VideoGamesViewControllerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testInit() {
        guard let controller = UIStoryboard(name: "VideoGames", bundle: nil).instantiateViewController(withIdentifier: "VideoGamesViewController") as? VideoGamesViewController else {
            return XCTFail("Could not instantiate VideoGamesViewController from VideoGames storyboard")
        }
        
        controller.loadViewIfNeeded()
        XCTAssertNotNil(controller.tableView)
        XCTAssertTrue(controller.tableView.delegate is VideoGamesViewController)
        XCTAssertTrue(controller.tableView.dataSource is VideoGamesViewController)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
