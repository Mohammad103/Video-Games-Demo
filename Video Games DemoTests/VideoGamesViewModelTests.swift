//
//  VideoGamesViewModelTests.swift
//  Video Games DemoTests
//
//  Created by Mohammad Shaker on 7/20/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import XCTest
@testable import Video_Games_Demo

class VideoGamesViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testInit() {
        let viewModel = VideoGamesViewModel()
        XCTAssertNotNil(viewModel)
    }
    
    func testTotalItemsCount() {
        let viewModel = VideoGamesViewModel()
        XCTAssertEqual(viewModel.totalCount(), 10)
    }
    
    func testVideoGameTitle() {
        let viewModel = VideoGamesViewModel()
        XCTAssertEqual(viewModel.title(at: 0), "Grand Theft Auto IV")
    }
    
    func testVideoGameCoverURL() {
        let viewModel = VideoGamesViewModel()
        XCTAssertEqual(viewModel.coverURL(at: 0), "https://cdn.tutsplus.com/psd/uploads/legacy/psdtutsarticles/linkb_60vgamecovers/1.jpg")
    }
    
    func testVideoGameRating() {
        let viewModel = VideoGamesViewModel()
        XCTAssertEqual(viewModel.rating(at: 0), 0.0)
    }
    
    func testSetVideoGameRating() {
        let viewModel = VideoGamesViewModel()
        viewModel.setRating(at: 0, rating: 5.0)
        XCTAssertEqual(viewModel.rating(at: 0), 5.0)
    }

    func testSetRandomRatings() {
        let viewModel = VideoGamesViewModel()
        viewModel.setRandomRatings()
        
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(viewModel.rating(at: 0)))
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(viewModel.rating(at: 1)))
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(viewModel.rating(at: 2)))
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(viewModel.rating(at: 3)))
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(viewModel.rating(at: 4)))
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(viewModel.rating(at: 5)))
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(viewModel.rating(at: 6)))
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(viewModel.rating(at: 7)))
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(viewModel.rating(at: 8)))
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(viewModel.rating(at: 9)))
    }
    
    func testSortVideoGames() {
        let viewModel = VideoGamesViewModel()
        viewModel.sortAndReload()
        
        XCTAssertEqual(viewModel.title(at: 0), "Crysis")
        XCTAssertEqual(viewModel.title(at: 9), "Super Mario Bros.")
    }
    
    func testRandomSortVideoGames() {
        let viewModel = VideoGamesViewModel()
        viewModel.setRandomRatings()
        viewModel.sortAndReload()
        
        XCTAssertTrue(viewModel.rating(at: 0) >= viewModel.rating(at: 1))
        XCTAssertTrue(viewModel.rating(at: 1) >= viewModel.rating(at: 2))
        XCTAssertTrue(viewModel.rating(at: 2) >= viewModel.rating(at: 3))
        XCTAssertTrue(viewModel.rating(at: 3) >= viewModel.rating(at: 4))
        XCTAssertTrue(viewModel.rating(at: 4) >= viewModel.rating(at: 5))
        XCTAssertTrue(viewModel.rating(at: 5) >= viewModel.rating(at: 6))
        XCTAssertTrue(viewModel.rating(at: 6) >= viewModel.rating(at: 7))
        XCTAssertTrue(viewModel.rating(at: 7) >= viewModel.rating(at: 8))
        XCTAssertTrue(viewModel.rating(at: 8) >= viewModel.rating(at: 9))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
