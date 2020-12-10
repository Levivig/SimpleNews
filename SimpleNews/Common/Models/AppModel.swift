//
//  AppModel.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 06..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

class AppModel: Codable {
    var news: [NewsArticle] = []
    
    var bookmarks: [NewsArticle] {
        news.filter({ $0.isBookmark ?? false })
    }

    func add(news: [NewsArticle]) {
        for article in news {
            if !self.news.contains(article) {
                self.news.append(article)
            }
        }
    }
    
    func updateBookmark(isOn: Bool, url: String?) {
        if let idx = news.firstIndex(where: { $0.url == url }) {
            news[idx].isBookmark = isOn
        }
    }
}
