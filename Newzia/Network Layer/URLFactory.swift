//
//  URLFactory.swift
//  Newzia
//
//  Created by Шермат Эшеров on 02/05/2023.
//

import Foundation

class URLFactory{
    
    private let baseUrl: URL
    let news: URL
    
    init(baseUrl: URL = URL(string: "https://www.reddit.com/r/")!){
        self.baseUrl = baseUrl
        self.news = URL(string: baseUrl.appendingPathComponent("news.json").description)!
    }    
}

