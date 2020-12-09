//
//  UIViewControllerExtensions.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 09..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */

    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
