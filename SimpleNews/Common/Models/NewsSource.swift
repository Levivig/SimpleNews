//
//  Source.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

struct NewsSource: Codable {
    var idx: String?
    var name: String = ""
    
    private enum CodingKeys : String, CodingKey {
        case name, idx = "id"
    }
}
