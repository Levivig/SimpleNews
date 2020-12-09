//
//  BaseTabbarProtocolController.swift
//  citychat
//
//  Created by Levente Vig on 2019. 07. 12..
//  Copyright © 2019. CodeYard. All rights reserved.
//

import UIKit

class BaseTabbarProtocolController: BaseViewController, TabbarProtocol {
    
    private(set) var tabbarTitle: String?
    private(set) var tabbarImage: UIImage?
    private(set) var selectedTabbarImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setTabbarItem() {
        tabBarItem = UITabBarItem(title: tabbarTitle,
                                  image: tabbarImage?.withTintColor(.gray, renderingMode: .alwaysOriginal),
                                  selectedImage: selectedTabbarImage?.withTintColor(.mainTintColor, renderingMode: .alwaysOriginal))
    }
}
