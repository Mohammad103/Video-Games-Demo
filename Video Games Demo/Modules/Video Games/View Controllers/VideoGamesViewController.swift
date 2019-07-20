//
//  VideoGamesViewController.swift
//  Video Games Demo
//
//  Created by Mohammad Shaker on 7/20/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import UIKit

class VideoGamesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = VideoGamesViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        viewModel.delegate = self
    }

    @IBAction func sortAllVideoGames() {
        viewModel.sortAndReload()
    }
    
    @IBAction func setRandomRatings() {
        viewModel.setRandomRatings()
        viewModel.sortAndReload()
    }
}


extension VideoGamesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoGameTableViewCell.self), for: IndexPath(row: 0, section: 0)) as! VideoGameTableViewCell
        cell.delegate = self
        
        let title = viewModel.title(at: indexPath.row)
        let coverImageURL = viewModel.coverURL(at: indexPath.row)
        let rating = viewModel.rating(at: indexPath.row)
        cell.setup(at: indexPath.row, title: title, coverImageURL: coverImageURL, rating: rating)
        
        return cell
    }
}


extension VideoGamesViewController: VideoGamesViewModelDelegate {
    func videoGamesUpdatedSuccessfully() {
        tableView.reloadData()
    }
    
    func failedLoadingVideoGames(errorMessage: String) {
        let alertController = UIAlertController(title: nil, message: errorMessage, preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
    }
}


extension VideoGamesViewController: VideoGameTableViewCellDelegate {
    func videoGameCellRatingValueChanged(at index: Int, rating: Double) {
        viewModel.setRating(at: index, rating: rating)
    }
}
