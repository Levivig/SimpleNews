//
//  ReadButton.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 09..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

class ReadButton: UIControl {

    // MARK: - Private properties -
    
    private var titleLabel: UILabel!
    
    // MARK: - Initialization -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .mainTintColor
        initTitleLabel()
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "ReadArticle".localized
        titleLabel.textColor = .black
        UIFont.preferredFont(forTextStyle: .caption1)
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Layout -
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius = height / 2.0
    }
    
}
