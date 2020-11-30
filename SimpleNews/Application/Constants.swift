//
//  Constants.swift
//  Template
//
//  Created by Levente Vig on 2019. 12. 22..
//  Copyright © 2019. levivig. All rights reserved.
//

import UIKit

//swiftlint:disable force_cast
let kAppDelegate = UIApplication.shared.delegate as! AppDelegate

struct Constants {
    
    static let newsBaseUrl = "https://newsapi.org/v2"
    static let newsApiKey = "51f93ce2c64d41629a9f7085b558e6ed"
    
    struct UserDefaults {
        static let ApiKey = "ApiKey"
    }
}
