//
//  BookmarkButton.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 05..
//  Copyright © 2020. levivig. All rights reserved.
//

import Lottie
import UIKit

protocol BookmarButtonDelegate: class {
    func bookmarkButtonTapped(isOn: Bool)
}

class BookmarkButton: UIControl {
    
    // MARK: - Public properties -
    
    weak var delegate: BookmarButtonDelegate?
    var shouldAnimate: Bool = true
    
    // MARK: - Private properties -
    
    private enum State {
        case selected
        case deselected
        
        var imageName: String {
            switch self {
            case .selected:
                return "bookmark.fill"
            case .deselected:
                return "bookmark"
            }
        }
    }
    
    private var bookmarkState: State = .deselected
    
    private var imageView = UIImageView()
    private var animationView = AnimationView()
    
    // MARK: - Initialization -
    
    init(withBackground: Bool = true) {
        super.init(frame: .zero)
        setup(withBackground: withBackground)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(withBackground: Bool = true) {
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        initBackgroundView(withBackground: withBackground)
        initImageView()
    }
    
    private func initBackgroundView(withBackground: Bool = true) {
        if withBackground {
            backgroundColor = UIColor.systemGray.withAlphaComponent(0.5)
        }
    }
    
    private func initImageView() {
        set(state: bookmarkState, animated: false)
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    // MARK: - Action -
    
    @objc private func tapped() {
        switch bookmarkState {
        case .selected:
            set(state: .deselected)
        case .deselected:
            set(state: .selected)
        }
        delegate?.bookmarkButtonTapped(isOn: bookmarkState == .selected)
    }
    
    // MARK: - Layout -
    
    private func set(state: State, animated: Bool = true) {
        self.bookmarkState = state
        let imageName: String = state.imageName
        
        if animated && shouldAnimate {
            transform = .init(scaleX: 0.3, y: 0.3)
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           usingSpringWithDamping: 0.45,
                           initialSpringVelocity: 7,
                           options: .allowUserInteraction,
                           animations: {
                            self.imageView.image = UIImage(systemName: imageName)?.withTintColor(.mainTintColor, renderingMode: .alwaysOriginal)
                            self.transform = .identity
                           }, completion: nil)
        } else {
            self.imageView.image = UIImage(systemName: imageName)?.withTintColor(.mainTintColor, renderingMode: .alwaysOriginal)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius = frame.width / 2.0
    }
    
    // MARK: - Bind -
    
    func bind(isSelected: Bool) {
        set(state: isSelected ? .selected : .deselected, animated: false)
    }
    
}
