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
    
    private lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height + 12000)
    
    private lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.contentSize = contentSize
        scrollV.frame = view.frame
        scrollV.showsVerticalScrollIndicator = false
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
        table.isScrollEnabled = false
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        initTableView()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(latesImage)
        latesImage.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(40)
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
        
        self.viewModel.newsSubscriber
            .map({$0.first?.data.children ?? []})
            .bind(to:
                    newsTable
                .rx.items(cellIdentifier: NewsCell.cellId, cellType: NewsCell.self)) {indexPath, model, cell in
                    cell.textLabel?.text = model.data.author
                }.disposed(by: disposeBag)
    }
}


extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
