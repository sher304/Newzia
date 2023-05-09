//
//  NewsCell.swift
//  Newzia
//
//  Created by Шермат Эшеров on 02/05/2023.
//

import UIKit
import Kingfisher
import SnapKit

class NewsCell: UITableViewCell{
    
    static let cellId = "NewsCell"
    
    private lazy var parentContent: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 22
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var newsImage: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .orange
        imageV.layer.cornerRadius = 25
        imageV.layer.masksToBounds = true
        return imageV
    }()
    
    private lazy var newsTitle: UILabel = {
        let label = UILabel()
        label.text = "'The Donald' forum user convicted of assaulting officers on Jan. 6"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        return label
    }()
    
    
    private lazy var commentsLabel: UILabel = {
        let label = UILabel()
        label.text = "130"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private lazy var commentImage: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(systemName: "text.bubble")
        imageV.tintColor = .systemGray
        return imageV
    }()
    
    private lazy var subredditLabel: UILabel = {
        let label = UILabel()
        label.text = "news"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        contentView.addSubview(parentContent)
        parentContent.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(20)
            make.bottom.equalTo(-20)
        }
        
        parentContent.addSubview(newsImage)
        newsImage.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(20)
            make.bottom.equalTo(-15)
            make.width.equalTo(self.contentView.frame.width / 3.5)
        }
        
        parentContent.addSubview(newsTitle)
        newsTitle.snp.makeConstraints { make in
            make.leading.equalTo(newsImage.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-5)
        }
        
        parentContent.addSubview(commentsLabel)
        commentsLabel.snp.makeConstraints { make in
            make.bottom.equalTo(newsImage.snp.bottom)
            make.leading.equalTo(newsTitle)
        }
        
        parentContent.addSubview(commentImage)
        commentImage.snp.makeConstraints { make in
            make.leading.equalTo(commentsLabel.snp.trailing)
            make.width.height.equalTo(15)
            make.centerY.equalTo(commentsLabel)
        }
        
        parentContent.addSubview(subredditLabel)
        subredditLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImage.snp.top).offset(5)
            make.leading.equalTo(newsTitle)
        }
    }
}

extension NewsCell{
    
    public func fetchData(subtitle: String, newsLabel: String,
                          commentTitle: String, imageURL: String){
        DispatchQueue.main.async {
            self.subredditLabel.text = subtitle
            self.newsTitle.text = newsLabel
            self.commentsLabel.text = commentTitle
            self.newsImage.kf.setImage(with: URL(string: imageURL))
        }
    }
}
