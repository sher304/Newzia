//
//  HomeVC.swift
//  Newzia
//
//  Created by Шермат Эшеров on 30/04/2023.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit


class HomeViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    private lazy var viewModel: HomeViewModel = {
        return HomeViewModel()
    }()
    
    private lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height + 300)
    
    private lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.contentSize = contentSize
        scrollV.frame = view.frame
        scrollV.contentInsetAdjustmentBehavior = .never
        return scrollV
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var latesImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .orange
        image.layer.cornerRadius = 14
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var latesTitle: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var newsTable: UITableView = {
        let table = UITableView()
        table.register(NewsCell.self, forCellReuseIdentifier: NewsCell.cellId)
        table.backgroundColor = .orange
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(latesImage)
        latesImage.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.height.equalTo(view.frame.height / 2)
        }
        
        latesImage.addSubview(latesTitle)
        latesTitle.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.bottom.equalTo(-40)
            make.trailing.equalTo(-20)
        }
        
        contentView.addSubview(newsTable)
        newsTable.snp.makeConstraints { make in
            make.top.equalTo(latesImage.snp.bottom).offset(30)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension HomeViewController {
    private func initTableView(){
        newsTable.rx.setDelegate(self).disposed(by: disposeBag)
        //        self.viewModel.newsSubject
        //            .bind(to: newsTable.rx.items(cellIdentifier: NewsCell.cellId, cellType: NewsCell.self)) {index , model, cell in
        //
        //        }.disposed(by: disposeBag)
        
        self.viewModel.newsSubscriber
            .bind(to: newsTable.rx.items(cellIdentifier: NewsCell.cellId, cellType: NewsCell.self)) { index, model, cell in
                
                
            }.disposed(by: disposeBag)
    }
    
}


extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
