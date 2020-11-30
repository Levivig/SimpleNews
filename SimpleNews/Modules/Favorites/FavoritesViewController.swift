//
//  FavoritesViewController.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FavoritesViewController: BaseTabbarProtocolController {

    // MARK: - Public properties -
    
    override var tabbarTitle: String? { "Favorites".localized }
    override var tabbarImage: UIImage? { UIImage(systemName: "heart") }
    override var selectedTabbarImage: UIImage? { UIImage(systemName: "heart.fill") }

    var presenter: FavoritesPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Extensions -

extension FavoritesViewController: FavoritesViewInterface {
}