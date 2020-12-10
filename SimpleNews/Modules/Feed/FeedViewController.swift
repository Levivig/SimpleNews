//
//  FeedViewController.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FeedViewController: BaseTabbarProtocolController {

    // MARK: - Public properties -
    
    override var tabbarTitle: String? { "Feed".localized }
    override var tabbarImage: UIImage? { UIImage(systemName: "book") }
    override var selectedTabbarImage: UIImage? { UIImage(systemName: "book.fill") }

    var presenter: FeedPresenterInterface!
    
    // MARK: - Private properties -
    
    private var collectionView: UICollectionView!
    private var refreshControl: UIRefreshControl!
    private var searchController: UISearchController!
    private var activityIndicator: UIActivityIndicatorView!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear(animated: animated)
    }
    
    // MARK: - Initialization -
    
    private func setup() {
        initNavigation()
        initCollectionView()
        initRefreshControl()
        initSearchController()
        initActivityIndicator()
    }
    
    private func initNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Feed".localized
    }
    
    private func initCollectionView() {
        let layout = NewsCollectionViewLayout(viewFrame: view.frame)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(cellWithClass: FeedCell.self)

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func initRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTriggered), for: .valueChanged)
        
        collectionView.refreshControl = refreshControl
    }
    
    private func initSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    private func initActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    // MARK: - Action -
    
    @objc private func refreshTriggered() {
        presenter.pullToRefresh { _ in
            self.refreshControl.endRefreshing()
        }
    }

}

// MARK: - Extensions -

extension FeedViewController: FeedViewInterface {
    func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showLoading() {
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
    }
}

extension FeedViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: FeedCell.self, for: indexPath)
        let model = presenter.itemAt(indexPath: indexPath)
        cell.bind(model: model)
        cell.delegate = self
        return cell
    }
}

extension FeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItemAt(indexPath: indexPath)
    }
}

extension FeedViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        presenter.search(for: text)
    }
}

extension FeedViewController: FeedCellDelegate {
    func bookmarkToggled(isOn: Bool, newsUrl: String?) {
        presenter.toggleBookmark(isOn: isOn, url: newsUrl)
    }
}
