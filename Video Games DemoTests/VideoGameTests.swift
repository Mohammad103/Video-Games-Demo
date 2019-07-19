//
//  VideoGameTests.swift
//  Video Games DemoTests
//
//  Created by Mohammad Shaker on 7/19/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import XCTest
@testable import Video_Games_Demo


class VideoGameTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testInit() {
        let videoGame = VideoGame(title: "FIFA 20", coverURL: nil, rating: 5.0)
        XCTAssertNotNil(videoGame)
        
        XCTAssertNotNil(videoGame.title)
        XCTAssertEqual(videoGame.title, "FIFA 20")
        
        XCTAssertNil(videoGame.coverURL)
        
        XCTAssertNotNil(videoGame.rating)
        XCTAssertEqual(videoGame.rating, 5.0)
    }

    func testRandomRating() {
        var videoGame = VideoGame(title: "FIFA 20", coverURL: nil, rating: 0.0)
        videoGame.setRandomRating()
        XCTAssertTrue(VideoGame.VideoGameRatings.contains(videoGame.rating))
    }
    
    func testInitWithDictionary() {
        let videoGame = VideoGame(dictionary: ["title": "FIFA 20"])
        XCTAssertNotNil(videoGame)
        
        XCTAssertNotNil(videoGame.title)
        XCTAssertEqual(videoGame.title, "FIFA 20")
        
        XCTAssertNil(videoGame.coverURL)
        
        XCTAssertNotNil(videoGame.rating)
        XCTAssertEqual(videoGame.rating, 0.0)
    }
    
    func testInitArrayWithDictionary() {
        let videoGamesDict = [["title": "FIFA 20"], ["title": "PES 20"]]
        let videoGames = VideoGame.parseJSON(dictionary: videoGamesDict)
        XCTAssertNotNil(videoGames)
        XCTAssertEqual(videoGames.count, 2)
        
        
        let fifaVideoGame = videoGames[0]
        XCTAssertNotNil(fifaVideoGame)
        
        XCTAssertNotNil(fifaVideoGame.title)
        XCTAssertEqual(fifaVideoGame.title, "FIFA 20")
        
        XCTAssertNil(fifaVideoGame.coverURL)
        
        XCTAssertNotNil(fifaVideoGame.rating)
        XCTAssertEqual(fifaVideoGame.rating, 0.0)
        
        
        let pesVideoGame = videoGames[1]
        XCTAssertNotNil(pesVideoGame)
        
        XCTAssertNotNil(pesVideoGame.title)
        XCTAssertEqual(pesVideoGame.title, "PES 20")
        
        XCTAssertNil(pesVideoGame.coverURL)
        
        XCTAssertNotNil(pesVideoGame.rating)
        XCTAssertEqual(pesVideoGame.rating, 0.0)
    }
    
    func testSort() {
        var videoGames = [VideoGame(title: "FIFA 20", coverURL: nil, rating: 2.0),
                          VideoGame(title: "PES 20", coverURL: nil, rating: 3.0),
                          VideoGame(title: "Assassin's Creed", coverURL: nil, rating: 5.0),
                          VideoGame(title: "Battlefield", coverURL: nil, rating: 4.0),
                          VideoGame(title: "Watch Dogs", coverURL: nil, rating: 5.0)]
        XCTAssertNotNil(videoGames)
        XCTAssertEqual(videoGames.count, 5)
        
        videoGames = VideoGame.sort(videoGames: videoGames)
        XCTAssertNotNil(videoGames)
        XCTAssertEqual(videoGames.count, 5)
        
        XCTAssertNotNil(videoGames[0])
        XCTAssertEqual(videoGames[0].title, "Assassin's Creed")
        
        XCTAssertNotNil(videoGames[1])
        XCTAssertEqual(videoGames[1].title, "Watch Dogs")
        
        XCTAssertNotNil(videoGames[2])
        XCTAssertEqual(videoGames[2].title, "Battlefield")
        
        XCTAssertNotNil(videoGames[3])
        XCTAssertEqual(videoGames[3].title, "PES 20")
        
        XCTAssertNotNil(videoGames[4])
        XCTAssertEqual(videoGames[4].title, "FIFA 20")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
