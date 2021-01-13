//
//  NetworkService.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 27.12.2020.
//

import Foundation

protocol NetworkServiceProtocol {
    func getChart(urlString: String, completion: @escaping (Result<[Chart]?, Error>) -> Void)
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
                completion(nil)
            }
            
            guard let data = data else { return }
            
            completion(data)
                
        }.resume()
    }
    
    
    func getChart(urlString: String, completion: @escaping (Result<[Chart]?, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let answer = try JSONDecoder().decode(ResponseChart.self, from: data)
                
                completion(.success(answer.feed.results))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
        
    }

}
