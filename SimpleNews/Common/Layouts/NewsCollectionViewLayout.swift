//
//  NewsCollectionViewLayout.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 10..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

class NewsCollectionViewLayout: UICollectionViewFlowLayout {
    
    // MARK: - Initialization -
    
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
        initSize(with: viewFrame, padding: padding)
        minimumLineSpacing = padding
        minimumInteritemSpacing = padding
        scrollDirection = .vertical
        sectionInset = UIEdgeInsets(top: padding, left: Devices.IPad ? padding : 0, bottom: padding, right: Devices.IPad ? padding : 0)
    }
    
    private func initSize(with frame: CGRect, padding: CGFloat = 20) {
        let columns: CGFloat = (frame.width > 500) ? 2 : 1
        let width: CGFloat = (frame.width - (columns + 1) * padding) / columns - (collectionView?.adjustedContentInset.left ?? 0)
        
        itemSize = CGSize(width: width, height: 200)
    }
    
    override func invalidateLayout() {
        super.invalidateLayout()
        initSize(with: collectionView?.frame ?? .zero)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return (self.collectionView?.bounds ?? newBounds) != newBounds
    }
    
}
