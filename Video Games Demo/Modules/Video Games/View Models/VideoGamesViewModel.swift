//
//  VideoGamesViewModel.swift
//  Video Games Demo
//
//  Created by Mohammad Shaker on 7/20/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import UIKit

protocol VideoGamesViewModelDelegate: AnyObject {
    func videoGamesUpdatedSuccessfully()
    func failedLoadingVideoGames(errorMessage: String)
}


class VideoGamesViewModel {

    weak var delegate: VideoGamesViewModelDelegate?
    private var videoGames: [VideoGame] = []

    
    init() {
        loadVideoGames()
        setRandomRatings()
        delegate?.videoGamesUpdatedSuccessfully()
    }
    
    func loadVideoGames() {
        if let path = Bundle.main.path(forResource: "video_games", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let videoGamesDic = jsonResult["video_games"] as? [[String: Any]] {
                    videoGames = VideoGame.parseJSON(dictionary: videoGamesDic)
                }
            } catch {
                delegate?.failedLoadingVideoGames(errorMessage: "Error happened while trying load video games data.")
            }
        }
    }
    
    func setRandomRatings() {
        for index in 0 ..< videoGames.count {
            videoGames[index].setRandomRating()
        }
    }
    
    func sortAndReload() {
        videoGames = VideoGame.sort(videoGames: videoGames)
        delegate?.videoGamesUpdatedSuccessfully()
    }
    
    
    // Datasource methods

    func totalCount() -> Int {
        return videoGames.count
    }
    
    func title(at index: Int) -> String? {
        return videoGames[index].title
    }
    
    func coverURL(at index: Int) -> String? {
        return videoGames[index].coverURL
    }
    
    func rating(at index: Int) -> Double {
        return videoGames[index].rating
    }
    
    func setRating(at index: Int, rating: Double) {
        videoGames[index].rating = rating
    }
    
}
