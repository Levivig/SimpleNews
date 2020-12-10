//
//  FeedInterfaces.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol FeedWireframeInterface: WireframeInterface {
    func openDetail(with article: NewsArticle)
}

protocol FeedViewInterface: ViewInterface {
    func reload()
    func showLoading()
    func hideLoading()
}

protocol FeedPresenterInterface: PresenterInterface {
    func pullToRefresh(completion: ((Bool) -> Void)?)
    func search(for text: String?)
    func toggleBookmark(isOn: Bool, url: String?)
    
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func itemAt(indexPath: IndexPath) -> FeedCellBindable
    
    func didSelectItemAt(indexPath: IndexPath)
}

protocol FeedInteractorInterface: InteractorInterface {
    func getNews(completion: NewsArticlesLoaded?)
}
