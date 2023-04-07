//
//  HTTPService.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation

enum CustomError: Error {
    case failed
}

typealias DeliveryClosure = ([DeliveryElement]) -> Void

protocol DeliveryAPI {
    func fetchDelivery(completion: @escaping DeliveryClosure)
}

class HTTPService {
        
    static let shared : HTTPService = HTTPService()
    
    private init() {}
    
}

extension HTTPService: DeliveryAPI {
    
    //MARK: - Fetching data
    
    func fetchDelivery(completion: @escaping ([DeliveryElement]) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "30590da0cdmsh3ceae06220440efp15d31ajsnddeda9ad1297",
            "X-RapidAPI-Host": "the-mexican-food-db.p.rapidapi.com"
        ]
        guard let url = URL(string: "https://the-mexican-food-db.p.rapidapi.com/") else {
            return
        }

        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
   
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                return
            }
           
            do {
                let result = try JSONDecoder().decode([DeliveryElement].self, from: data)
                completion(result)
            } catch let error {
                print(error)
            }
        })
        dataTask.resume()
    }
}
