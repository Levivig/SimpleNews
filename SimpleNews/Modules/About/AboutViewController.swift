//
//  AboutViewController.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class AboutViewController: BaseTabbarProtocolController {

    // MARK: - Public properties -
    
    override var tabbarTitle: String? { "About".localized }
    override var tabbarImage: UIImage? { UIImage(systemName: "person.2") }
    override var selectedTabbarImage: UIImage? { UIImage(systemName: "person.2.fill") }

    var presenter: AboutPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Extensions -

extension AboutViewController: AboutViewInterface {
}
