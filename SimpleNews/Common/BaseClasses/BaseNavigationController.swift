//
//  BaseNavigationController.swift
//  Template
//
//  Created by Levente Vig on 2019. 09. 21..
//  Copyright © 2019. levivig. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        viewControllers.last?.preferredStatusBarStyle ?? .default
    }
    
    // MARK: - Initialization -
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setup()
    }
    
    private func setup() {
        setNavigationBarHidden(true, animated: false)
        navigationBar.tintColor = .mainTintColor
        navigationBar.prefersLargeTitles = true
    }
}

extension BaseNavigationController: TabbarProtocol {
    
    var tabbarTitle: String? { (viewControllers.first as? TabbarProtocol)?.tabbarTitle }
    var tabbarImage: UIImage? { (viewControllers.first as? TabbarProtocol)?.tabbarImage }
    var selectedTabbarImage: UIImage? { (viewControllers.first as? TabbarProtocol)?.selectedTabbarImage }
    
    func setTabbarItem() {
        (viewControllers.first as? TabbarProtocol)?.setTabbarItem()
        tabBarItem = viewControllers.first?.tabBarItem
    }
}
