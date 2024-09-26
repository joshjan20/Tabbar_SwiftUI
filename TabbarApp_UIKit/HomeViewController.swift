//
//  HomeViewController.swift
//  TabbarApp_UIKit_Storyboard
//
//  Created by JJ on 26/09/24.
//


import UIKit
import AVKit
import AVFoundation

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var player: AVPlayer!
    var playerViewController: AVPlayerViewController!
    var tableView: UITableView!
    
    // Dummy data for the table view
    let tableData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // First, set up the video player
        setupVideoPlayer()
        
        // After the video player is set up, set up the table view
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.setupTableView()
        }
    }
    
    // Function to set up the video player at the top half of the screen
    func setupVideoPlayer() {
        guard let videoURL = Bundle.main.url(forResource: "demo", withExtension: "mp4") else {
            print("Video not found! Check the file name and make sure it's added to the project.")
            return
        }
        
        // Initialize the AVPlayer and AVPlayerViewController
        player = AVPlayer(url: videoURL)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        // Ensure playerViewController is properly added to the view hierarchy before setting constraints
        addChild(playerViewController)
        playerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: self)
        
        // Set up auto layout constraints for the video player
        NSLayoutConstraint.activate([
            playerViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            playerViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playerViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)  // Video takes up the top half
        ])
        
        // Start playing the video
        player.play()
    }
    
    // Function to set up the table view at the bottom half of the screen
    func setupTableView() {
        // Make sure that playerViewController is initialized before using it
        guard playerViewController != nil else {
            print("PlayerViewController is not initialized!")
            return
        }
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        // Set up auto layout constraints for the table view
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: playerViewController.view.bottomAnchor),  // Below the video player
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)  // Bottom of the screen
        ])
    }
    
    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(tableData[indexPath.row])")
    }
    // Function to set up a label in the bottom half of the screen
    func setupBottomLabel() {
     let label = UILabel()
     label.text = "Home"
     label.font = UIFont.systemFont(ofSize: 32)
     label.textAlignment = .center
     label.frame = CGRect(x: 0, y: view.frame.height / 2, width: view.frame.width, height: view.frame.height / 2)
     view.addSubview(label)
     }
}

