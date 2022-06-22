//
//  ViewController.swift
//  netflix
//
//  Created by Ankit on 6/20/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    //MARK: - Properties
    
    //MARK: - Selectors
    
    //MARK: - Lifecycle
    override func viewDidLoad() { 
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupTabBar()
    }

    //MARK: - Helpers
    
    func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    func setupTabBar() {
        
        setViewControllers([
            createTabViewController(.home),
            createTabViewController(.upcoming),
            createTabViewController(.search),
            createTabViewController(.downloads)
        ], animated: true)
        
        tabBar.tintColor = .label
    }
    
    func createTabViewController(_ tab: TabBar) -> UINavigationController {
        let nav = UINavigationController(rootViewController: tab.controller)
        nav.title = tab.title
        nav.tabBarItem.image = UIImage(systemName: tab.icon)
        return nav
    }
    
}

   
 
