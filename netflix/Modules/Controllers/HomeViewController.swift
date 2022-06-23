//
//  HomeViewController.swift
//  netflix
//
//  Created by Ankit on 6/20/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    
    let sectionTitles: [String] = ["Trending Movies",  "Trending TV", "Popular" , "Upcomming Movies", "Top Rated"]
    
    let homefeedTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Selectors
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        setupDelegates()
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homefeedTable.frame = view.bounds
    }
    
    //MARK: - Helpers
    
    private func setupNavigationBar() {
        let nexflixLogo = UIImage(named: "netflixLogo")
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(nexflixLogo, for: .normal)
        let leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        leftBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .label
    }
    
    private func setupDelegates() {
        homefeedTable.delegate = self
        homefeedTable.dataSource = self
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        homefeedTable.tableHeaderView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        view.addSubview(homefeedTable)
    }
    
    func fetchData() {
        

//        APICaller.shared.apiCall(apiPath: .getTrendingTv) { result in
//            switch result{
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//        APICaller.shared.apiCall(apiPath: .getTrendingMovie) { result in
//            switch result{
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//        APICaller.shared.apiCall(apiPath: .getUpcomming) { result in
//            switch result{
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//        APICaller.shared.apiCall(apiPath: .getPopular) { result in
//            switch result{
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//        APICaller.shared.apiCall(apiPath: .getTopRated) { result in
//            switch result{
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        cell.textLabel?.text = "Hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        header.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y , width: header.bounds.width, height: header.bounds.height)
        header.textLabel?.textColor = .label
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defauleOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defauleOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
