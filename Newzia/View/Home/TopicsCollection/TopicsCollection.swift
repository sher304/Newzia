//
//  TopicsCollection.swift
//  Newzia
//
//  Created by Шермат Эшеров on 30/04/2023.
//

import UIKit
import SnapKit

class TopicsCollection: UICollectionViewCell{
    
    static let cellId = "TopicCell"
    
    private lazy var topicImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.layer.cornerRadius = 32
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var topicTitle: UILabel = {
        let label = UILabel()
        label.text = "Science"
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        
        contentView.addSubview(topicImage)
        topicImage.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
        }
        
        topicImage.addSubview(topicTitle)
        topicTitle.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.bottom.equalTo(-15)
        }
    }
}

