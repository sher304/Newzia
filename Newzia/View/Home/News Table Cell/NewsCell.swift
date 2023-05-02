//
//  NewsCell.swift
//  Newzia
//
//  Created by Шермат Эшеров on 02/05/2023.
//

import UIKit

class NewsCell: UITableViewCell{
    
    static let cellId = "NewsCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        contentView.backgroundColor = .green
    }
    
    
}
