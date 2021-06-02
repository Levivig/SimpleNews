//
//  FeedCell.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 11. 30..
//  Copyright © 2020. levivig. All rights reserved.
//

import SDWebImage
import UIKit

protocol FeedCellBindable {
    var feedCellTitle: String { get }
    var feedCellSource: String { get }
    var feedCellDate: String { get }
    var feedCellImageUrl: URL? { get }
    var feedCellIsBookmark: Bool { get set }
    
    var feedCellUrl: String? { get }
}

protocol FeedCellDelegate: AnyObject {
    func bookmarkToggled(isOn: Bool, newsUrl: String?)
}

class FeedCell: UICollectionViewCell {
    
    // MARK: - Public properties -
    
    weak var delegate: FeedCellDelegate?
    
    // MARK: - Private properties -
    
    private var titleLabel = UILabel()
    private var sourceLabel = UILabel()
    private var dateLabel = UILabel()
    private var backgroundImageView = UIImageView()
    private var gradientView = GradientView()
    private var bookmarkButton = BookmarkButton()
    
    private var placeholderImage: UIImage? = UIImage(named: "placeholder")
    
    private var newsUrl: String?
    
    // MARK: - Initialization -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.cornerRadius = 8
        
        initBackgroundImageView()
        initGradientView()
        initSourceLabel()
        initDateLabel()
        initTitleLabel()
        initBookmarkButton()
    }
    
    private func initTitleLabel() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(sourceLabel.snp.top).offset(-12)
        }
    }
    
    private func initSourceLabel() {
        sourceLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        sourceLabel.textColor = .white
        sourceLabel.textAlignment = .left
        
        contentView.addSubview(sourceLabel)
        sourceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    private func initDateLabel() {
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .right
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(sourceLabel.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    private func initBackgroundImageView() {
        backgroundImageView.image = placeholderImage
        backgroundImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func initBookmarkButton() {
        bookmarkButton.delegate = self
        
        contentView.addSubview(bookmarkButton)
        bookmarkButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.width.height.equalTo(44)
        }
    }
    
    private func initGradientView() {
        contentView.addSubview(gradientView)
        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Bind -
    
    func bind(model: FeedCellBindable) {
        titleLabel.text = model.feedCellTitle
        sourceLabel.text = model.feedCellSource
        dateLabel.text = model.feedCellDate
        backgroundImageView.sd_setImage(with: model.feedCellImageUrl, placeholderImage: placeholderImage)
        bookmarkButton.bind(isSelected: model.feedCellIsBookmark)
        
        newsUrl = model.feedCellUrl
    }
}

extension FeedCell: BookmarButtonDelegate {
    func bookmarkButtonTapped(isOn: Bool) {
        delegate?.bookmarkToggled(isOn: isOn, newsUrl: newsUrl)
    }
}
