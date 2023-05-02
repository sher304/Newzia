//
//  HomeViewModel.swift
//  Newzia
//
//  Created by Шермат Эшеров on 02/05/2023.
//

import Foundation
import RxSwift

class HomeViewModel{
    
    private let newsSubject = BehaviorSubject<[News]>(value: [News]())

    var newsSubscriber: Observable<[News]> {
        return newsSubject.asObservable()
    }
    
    func viewDidLoad(){
        ApiAuth().getNews { newsData in
            switch newsData{
            case.success(let news):
                self.newsSubject.onNext([news])
                break
            case.failure(_):
                break
            }
        }
    }
}
