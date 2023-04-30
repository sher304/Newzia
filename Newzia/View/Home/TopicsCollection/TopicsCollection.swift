//
//  TopicsCollection.swift
//  Newzia
//
//  Created by Шермат Эшеров on 30/04/2023.
//

import UIKit

class TopicsCollection: UICollectionViewCell{
    
    static let cellId = "TopicCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        contentView.backgroundColor = .green
    }
}

