//
//  RestClient+News.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

typealias NewsArticlesResult = Result<NewsResponse, Error>
typealias NewsArticlesLoaded = (NewsArticlesResult) -> Void

extension RestClient {
    
    func loadTopHeadlines(country: String = "hu", completion: NewsArticlesLoaded? = nil) {
        let url = "\(Constants.newsBaseUrl)/top-headlines?country=\(country)&apiKey=\(Constants.newsApiKey)"
        
        request(url: url) { (result: NewsArticlesResult) in
            completion?(result)
        }
    }
    
}
