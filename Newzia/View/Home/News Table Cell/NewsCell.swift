//
//  NewsCell.swift
//  Newzia
//
//  Created by Шермат Эшеров on 02/05/2023.
//

import UIKit
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
        label.text = "1303"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        
        
        let image = UIImage(systemName: "text.bubble")
        let imageV = UIImageView(image: image)
        imageV.frame = CGRect(x: 35, y: 0, width: 15, height: 15)
        label.addSubview(imageV)
        return label
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
        
        parentContent.addSubview(subredditLabel)
        subredditLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImage.snp.top)
            make.leading.equalTo(newsTitle)
        }
    }
    
    
}
