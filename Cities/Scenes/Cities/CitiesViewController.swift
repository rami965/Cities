//
//  CitiesViewController.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

class CitiesViewController: BaseViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    private let viewTitle = "Cities"
    
    let cellIdentifier = String(describing: CitiesTableViewCell.self)
    var presenter: CitiesPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupTableView()
        
        presenter?.viewDidLoad()
    }
    
    private func configureView() {
        title = viewTitle
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: cellIdentifier)
        
        tableView.addInfiniteScroll { (tableView) in
            self.presenter?.fetchCities(isLoadingMore: true)
            tableView.finishInfiniteScroll()
        }
    }
    
    func setPresenter(_ presenter: CitiesPresenter) {
        self.presenter = presenter
    }
}

extension CitiesViewController: CitiesViewDelegate {
    func reloadData() {
        tableView.reloadData()
    }
    
    func hideLoadMoreIndicator() {
        tableView.finishInfiniteScroll()
    }
    
    func showLoader() {
        showLoaderView()
    }
    
    func hideLoader() {
        hideLoaderView()
    }
    
    func showError(error: String) {
        
    }
}
