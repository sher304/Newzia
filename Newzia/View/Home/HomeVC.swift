//
//  ViewController.swift
//  Newzia
//
//  Created by Шермат Эшеров on 30/04/2023.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class HomeViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
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
    
    private lazy var topicsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(TopicsCollection.self, forCellWithReuseIdentifier: TopicsCollection.cellId)

        collection.backgroundColor = .orange
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        initCollection()
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
        
        
        view.addSubview(topicsCollection)
        topicsCollection.snp.makeConstraints { make in
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
            make.bottom.equalToSuperview()
            make.top.equalTo(searcTextField.snp.bottom).offset(10)
        }
    }
    
    func initCollection(){
        self.topicsCollection.rx.setDelegate(self).disposed(by: disposeBag)
        self.topicsCollection.rx.setDataSource(self).disposed(by: disposeBag)
    }
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicsCollection.cellId, for: indexPath) as?  TopicsCollection else { return TopicsCollection()}
        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
