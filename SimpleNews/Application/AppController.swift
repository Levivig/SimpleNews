//
//  AppController.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 06..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

final class AppController {

    enum Keys {
        static let appModel = "appModel"
    }

    // MARK: - Public properties -

    var news: [NewsArticle] { appModel?.news ?? [] }
    
    var bookmarks: [NewsArticle] { appModel?.bookmarks ?? [] }

    // MARK: - Private properties -

    private var appModel: AppModel?
    private let defaults = UserDefaults.standard

    // MARK: - Initialization -

    init() {
        getSavedAppModel()
    }

    func getSavedAppModel() {
        if let data = defaults.object(forKey: Keys.appModel) as? Data {
            do {
                let decoder = JSONDecoder()
                let appModel = try decoder.decode(AppModel.self, from: data)
                self.appModel = appModel
            } catch let exc {
                log.debug(exc.localizedDescription)
            }
        } else {
            self.appModel = AppModel()
        }
    }

    func saveAppModel() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(appModel)
            defaults.set(data, forKey: Keys.appModel)
        } catch let exc {
            log.debug(exc)
        }
    }

    func updateAll(news: [NewsArticle]) {
        appModel?.news = news
        saveAppModel()
    }
    
    func add(news: [NewsArticle]) {
        appModel?.add(news: news)
        saveAppModel()
    }
    
    func updateBookmark(isOn: Bool, url: String?) {
        appModel?.updateBookmark(isOn: isOn, url: url)
        saveAppModel()
    }
}
