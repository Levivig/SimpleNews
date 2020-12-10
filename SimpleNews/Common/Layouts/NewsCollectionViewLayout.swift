//
//  NewsCollectionViewLayout.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 10..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

class NewsCollectionViewLayout: UICollectionViewFlowLayout {
    
    init(viewFrame: CGRect) {
        super.init()
        setup(viewFrame: viewFrame)
    }
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(viewFrame: CGRect = kAppDelegate.window?.frame ?? .zero) {
        let padding: CGFloat = 20
        let width: CGFloat = Devices.IPad ? (((viewFrame.width - 3 * padding) / 2.0)) : (viewFrame.width - 2 * padding)
        
        itemSize = CGSize(width: width, height: 200)
        minimumLineSpacing = padding
        minimumInteritemSpacing = padding
        scrollDirection = .vertical
        sectionInset = UIEdgeInsets(top: padding, left: Devices.IPad ? padding : 0, bottom: padding, right: Devices.IPad ? padding : 0)
    }
    
}
