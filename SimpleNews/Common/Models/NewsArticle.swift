//
//  NewsArticle.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

struct NewsArticle: Codable, Equatable {

    var source: NewsSource?
    var author: String?
    var title: String = ""
    var description: String? = ""
    var url: String = ""
    var urlToImage: String? = ""
    var publishedAt: Date?
    var content: String?
    
    var isBookmark: Bool? = false
    
    static func == (lhs: NewsArticle, rhs: NewsArticle) -> Bool {
        return lhs.url == rhs.url
    }
}
