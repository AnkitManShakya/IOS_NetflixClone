//
//  TabBarEnum.swift
//  netflix
//
//  Created by Ankit on 6/20/22.
//

import Foundation
import UIKit

enum TabBar {
    case home
    case upcoming
    case search
    case downloads
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .upcoming:
            return "play.circle"
        case .search:
            return "magnifyingglass"
        case .downloads:
            return "arrow.down.to.line"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .upcoming:
            return "Coming Soon"
        case .search:
            return "Top Seach"
        case .downloads:
            return "Downloads"
        }
    }
    
    var controller: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .upcoming:
            return UpcomingViewController()
        case .search:
            return SearchViewController()
        case .downloads:
            return DownloadsViewController()
        }
    }
}
