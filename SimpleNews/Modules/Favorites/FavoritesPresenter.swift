//
//  FavoritesPresenter.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FavoritesPresenter {

    // MARK: - Private properties -

    private unowned let view: FavoritesViewInterface
    private let interactor: FavoritesInteractorInterface
    private let wireframe: FavoritesWireframeInterface

    // MARK: - Lifecycle -

    init(view: FavoritesViewInterface, interactor: FavoritesInteractorInterface, wireframe: FavoritesWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension FavoritesPresenter: FavoritesPresenterInterface {
}