//
//  VideoGame.swift
//  Video Games Demo
//
//  Created by Mohammad Shaker on 7/19/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import UIKit

struct VideoGame {
    
    static let VideoGameRatings: [Double] = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
    
    var title: String?
    var coverURL: String?
    var rating: Double = 0.0
    
    init() {
    }
    
    init(title: String?, coverURL: String?, rating: Double = 0.0) {
        self.title = title
        self.coverURL = coverURL
        self.rating = rating
    }
    
    init(dictionary: [String: Any]) {
        self.init(title: dictionary["title"] as? String, coverURL: dictionary["cover_url"] as? String)
    }
    
    mutating func setRandomRating() {
        rating = VideoGame.VideoGameRatings.randomElement() ?? 0.0
    }
    
    
    // Class methods
    
    static func sort(videoGames: [VideoGame]) -> [VideoGame] {
        var sortedVideoGames = videoGames
        sortedVideoGames.sort {
            if $0.rating != $1.rating { // first, compare by rating
                return $0.rating > $1.rating
            } else { // Break ties by title
                return $0.title! < $1.title!
            }
        }
        return sortedVideoGames
    }
    
    static func parseJSON(dictionary: [[String: Any]]) -> [VideoGame] {
        var videoGames: [VideoGame] = []
        for object in dictionary {
            let videoGame = VideoGame(dictionary: object)
            videoGames.append(videoGame)
        }
        return videoGames
    }
}
