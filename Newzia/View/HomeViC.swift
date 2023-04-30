//
//  ViewController.swift
//  Newzia
//
//  Created by Шермат Эшеров on 30/04/2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private lazy var topicTitle: UILabel = {
        let label = UILabel()
        label.text = "Choose your topics"
        label.textColor = .black
        label.font = .systemFont(ofSize: 42, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var searcTextField: UISearchBar = {
        let searchB = UISearchBar()
        searchB.layer.cornerRadius = 22
        searchB.autocorrectionType = .no
        searchB.autocapitalizationType = .none
        
        searchB.backgroundImage = UIImage()
        searchB.backgroundColor = .systemGray6
        searchB.searchTextField.leftView?.tintColor = .systemGray
        searchB.searchTextField.backgroundColor = .systemGray6
        
        searchB.searchTextField.textColor = .systemGray
        searchB.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search topics...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray])
        return searchB
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .white
        
        view.addSubview(topicTitle)
        topicTitle.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(45)
            make.trailing.equalTo(-30)
        }
        
        view.addSubview(searcTextField)
        searcTextField.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(topicTitle.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
    }
    
    
}

