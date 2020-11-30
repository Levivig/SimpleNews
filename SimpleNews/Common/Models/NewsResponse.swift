//
//  NewsResponse.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
    var status: String = "unknown"
    var totalResults: Int = 0
    var articles: [NewsArticle] = []
}
