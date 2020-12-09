//
//  NewsArticle+FeedCellBindable.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 05..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

extension NewsArticle: FeedCellBindable {
    var feedCellTitle: String {
        title
    }
    
    var feedCellSource: String {
        source?.name ?? ""
    }
    
    var feedCellDate: String {
        publishedAt?.string(withFormat: "yyyy-MM-dd HH:mm") ?? ""
    }
    
    var feedCellImageUrl: URL? {
        URL(string: urlToImage ?? "")
    }
    
    var feedCellIsBookmark: Bool {
        set {
            isBookmark = newValue
        }
        get {
            isBookmark ?? false
        }
    }
    
    var feedCellUrl: String? {
        url
    }
}
