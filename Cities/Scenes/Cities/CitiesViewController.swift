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
    
    let searchController = UISearchController(searchResultsController: nil)
    let cellIdentifier = String(describing: CitiesTableViewCell.self)
    
    var presenter: CitiesPresenter?
    
    var isSearchBarEmpty: Bool {
        let isValidString = searchController
            .searchBar.text?.isValidString ?? false
        return !isValidString
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupTableView()
        configureSearchController()
        
        presenter?.viewDidLoad()
    }
    
    private func configureView() {
        title = viewTitle
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Enter search keyword ..."
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: cellIdentifier)
        
        configureInfiniteScroll()
    }
    
    private func configureInfiniteScroll() {
        tableView.addInfiniteScroll { (tableView) in
            if !self.isFiltering {
                self.presenter?.fetchCities(isLoadingMore: true)
            } else {
                tableView.finishInfiniteScroll()
            }
        }
    }
    
    func setPresenter(_ presenter: CitiesPresenter) {
        self.presenter = presenter
    }
}

extension CitiesViewController: CitiesViewDelegate {
    func reloadData(animated: Bool) {
        animated
            ? UIView.transition(with: tableView,
                                duration: 0.35,
                                options: .transitionCrossDissolve,
                                animations: { self.tableView.reloadData() })
            : tableView.reloadData()
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
        AlertViewHelper.showAlertWithOneButton(with: "Error",
                                               message: error,
                                               buttonTitle: "Ok",
                                               on: self)
    }
}

extension CitiesViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    presenter?.filterCitiesForSearchText(searchBar.text)
  }
}
