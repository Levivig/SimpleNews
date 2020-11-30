//
//  FeedCell.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: - Initialization -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
    }
    
    // MARK: - Bind -
    
    func bind(model: NewsArticle) {
        
    }
}
