//
//  NewsArticle.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

struct NewsArticle: Codable {
    var source: NewsSource?
    var author: String = ""
    var title: String = ""
    var description: String = ""
    var url: String = ""
    var urlToImage: String = ""
    var publishedAt: Date?
    var content: String?
    
}
