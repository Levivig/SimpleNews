//
//  DBManager.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

class DBManager {
    
    static let shared = DBManager()
    private init() {
//        setup()
    }
    
//    private func setup() {
//        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
//            log.warning("documentDirectory not found")
//            return
//        }
//
//        do {
//            let db = try Connection("\(path)/db.sqlite3")
//            let news = Table("NewsArticles")
//            try db.run(news.create(ifNotExists: true) { table in
//                table.column(idx, primaryKey: true) //     "id" INTEGER PRIMARY KEY NOT NULL,
//            })
//        } catch let exc {
//            log.warning("db connection failed. \(exc.localizedDescription)")
//        }
//
//
//    }
}
