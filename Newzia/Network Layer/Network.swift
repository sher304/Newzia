//
//  Network.swift
//  Newzia
//
//  Created by Шермат Эшеров on 02/05/2023.
//

import Foundation
import Alamofire

class NetworkLayer {
    
    static func basicUrl<T: Codable>(url: URLRequest, method: String, completion: @escaping(Result<T, Error>) -> Void){
        
        guard url.url != nil else { return }
        
        var requets = URLRequest(url: url.url!)
        requets.httpMethod = method.uppercased()
        
        AF.request(requets).response { responce in
            DispatchQueue.main.async {
                guard let data = responce.data,
                      let jsonObj = try? JSONDecoder().decode(T.self, from: data)
                else { return }
                completion(.success(jsonObj))
            }
        }
    }
}
