//
//  FavoritesInterfaces.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol FavoritesWireframeInterface: WireframeInterface {
    func openDetail(with article: NewsArticle)
}

protocol FavoritesViewInterface: ViewInterface {
    func reload()
}

protocol FavoritesPresenterInterface: PresenterInterface {
    func pullToRefresh(completion: ((Bool) -> Void)?)
    func search(for text: String?)
    func toggleBookmark(isOn: Bool, url: String?)
    
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func itemAt(indexPath: IndexPath) -> FeedCellBindable
    func isEmpty() -> Bool
    
    func didSelectItemAt(indexPath: IndexPath)
}

protocol FavoritesInteractorInterface: InteractorInterface {
    func getFavorites(completion: NewsArticlesLoaded)
}
