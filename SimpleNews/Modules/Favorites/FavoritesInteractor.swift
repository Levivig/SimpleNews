//
//  FavoritesInteractor.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class FavoritesInteractor {
}

// MARK: - Extensions -

extension FavoritesInteractor: FavoritesInteractorInterface {
    func getFavorites(completion: NewsArticlesLoaded) {
        var newsResponse = NewsResponse()
        newsResponse.articles = kAppDelegate.appController.bookmarks
        completion(Result.success(newsResponse))
    }
    
}
