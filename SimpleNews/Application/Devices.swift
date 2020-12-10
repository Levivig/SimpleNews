//
//  Devices.swift
//  xeropan
//
//  Created by Zsolt Pete on 2018. 12. 16..
//  Copyright © 2018. CodeYard. All rights reserved.
//

import UIKit

enum Devices {
    static let IPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    static let IPad129: Bool = IPad && UIScreen.main.bounds.size.height == 1366
    static let IPad105: Bool = IPad && UIScreen.main.bounds.size.height == 1112
    static let IPad11: Bool = IPad && UIScreen.main.bounds.size.height == 1194
    /**
     iPad 3, iPad 4, iPad Air, iPad Air 2, 9.7-inch iPad Pro, iPad Mini 2, iPad Mini 3, iPad Mini 4
     */
    static let IPadAir: Bool = IPad && UIScreen.main.bounds.size.height == 1024

    /**
     iPhone 6 Plus, iPhone 6S Plus, iPhone 8 Plus
     One dimension is for the simulator and the other for the actual device.
     */
    static let iPhone7Plus: Bool = !IPad && UIScreen.main.bounds.size.height == 736
    /**
     iPhone 5S, iPhone 5
     */
    static let iPhoneSE: Bool = !IPad && UIScreen.main.bounds.size.height == 568
    /**
     iPhone 6, iPhone 6S, iPhone 7, iPhone 8,
     */
    static let iPhone7: Bool = !IPad && UIScreen.main.bounds.size.height == 667
    /**
     iPhone Xs
     */
    static let iPhoneX: Bool = !IPad && UIScreen.main.bounds.size.height == 812
    /**
     iPhone XR and iPhone XS Max
     */
    static let iPhoneXr: Bool = !IPad && UIScreen.main.bounds.size.height == 896
    static let iPhoneXsMax: Bool = !IPad && UIScreen.main.bounds.size.height == 896

    static let iPhoneXLike: Bool = !IPad && (iPhoneX || iPhoneXr || iPhoneXsMax)
}
