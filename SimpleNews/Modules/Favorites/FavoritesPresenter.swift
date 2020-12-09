//
//  FavoritesPresenter.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FavoritesPresenter {

    // MARK: - Private properties -

    private unowned let view: FavoritesViewInterface
    private let interactor: FavoritesInteractorInterface
    private let wireframe: FavoritesWireframeInterface
    
    private var items: [NewsArticle] = []
    
    private var isFiltering: Bool = false
    private var filteredItems: [NewsArticle] = [] { didSet { view.reload() } }

    // MARK: - Lifecycle -

    init(view: FavoritesViewInterface, interactor: FavoritesInteractorInterface, wireframe: FavoritesWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        loadData()
    }
    
    func viewWillAppear(animated: Bool) {
        loadData()
    }
    
    private func loadData(completion: ((Bool) -> Void)? = nil) {
        interactor.getFavorites { [weak self] result in
            switch result {
            case .success(let data):
                self?.items = data.articles
                completion?(true)
            case .failure(let error):
                self?.wireframe.showErrorAlert(with: error.localizedDescription)
                completion?(false)
            }
            self?.view.reload()
        }
    }
}

// MARK: - Extensions -

extension FavoritesPresenter: FavoritesPresenterInterface {
    func search(for text: String?) {
        if let text = text?.lowercased(), text != "" {
            isFiltering = true
            filteredItems = items.filter({ article -> Bool in
                return (article.content?.lowercased().contains(text) ?? false) || (article.source?.name.lowercased().contains(text) ?? false) || article.title.lowercased().contains(text)
            })
        } else {
            isFiltering = false
        }
        view.reload()
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        if isFiltering { return filteredItems.count }
        return items.count
    }
    
    func itemAt(indexPath: IndexPath) -> FeedCellBindable {
        if isFiltering { return filteredItems[indexPath.row] }
        return items[indexPath.row]
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        let item: NewsArticle
        if isFiltering {
            item = filteredItems[indexPath.row]
        } else {
            item = items[indexPath.row]
        }
        wireframe.openDetail(with: item)
    }
    
    func pullToRefresh(completion: ((Bool) -> Void)?) {
        loadData(completion: completion)
    }
    
    func toggleBookmark(isOn: Bool, url: String?) {
        if let idx = items.firstIndex(where: { $0.url == url }) {
            items[idx].isBookmark = isOn
            kAppDelegate.appController.updateBookmark(isOn: isOn, url: url)
        }
    }
    
    func isEmpty() -> Bool {
        items.isEmpty
    }
}
