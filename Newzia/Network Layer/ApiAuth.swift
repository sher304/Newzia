//
//  ApiAuth.swift
//  Newzia
//
//  Created by Шермат Эшеров on 02/05/2023.
//

import Foundation

class ApiAuth{
    
    let urlFactory = URLFactory()
    
    func getNews(completion: @escaping(Result<News, Error>) -> Void){
        let url = URLRequest(url: urlFactory.news)
        NetworkLayer.basicUrl(url: url, method: "get", completion: completion)
    }
    
}
