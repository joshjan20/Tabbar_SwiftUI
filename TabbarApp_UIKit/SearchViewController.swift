//
//  SearchViewController.swift
//  TabbarApp_UIKit_Storyboard
//
//  Created by JJ on 26/09/24.
//

import UIKit

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Search"
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .center
        label.frame = view.bounds
        
        view.addSubview(label)
    }
}

