//
//  FavoritesEmptyView.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 06..
//  Copyright © 2020. levivig. All rights reserved.
//

import Lottie
import UIKit

class FavoritesEmptyView: UIView {
    
    // MARK: - Private properties -
    
    private var animationView = AnimationView()
    private var titleLabel = UILabel()
    
    // MARK: - Initialization -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
//        backgroundColor = .gray
        initAnimationView()
        initTitleLabel()
    }
    
    private func initAnimationView() {
        animationView.animation = Animation.named("bookmark_anim")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.width.height.equalTo(150)
        }
    }
    
    private func initTitleLabel() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        titleLabel.textColor = .secondaryLabel
        titleLabel.text = "NoFavorites".localized
        titleLabel.textAlignment = .center
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(animationView.snp.bottom).offset(20)
            make.bottom.lessThanOrEqualToSuperview().offset(-20)
        }
    }
    
    // MARK: - Public API -
    
    func play() {
        animationView.play()
    }
    
    func stop() {
        animationView.stop()
    }
    
}
