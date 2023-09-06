//
//  NetworkService.swift
//  Solid Principles
//
//  Created by Pavan Kumar J on 06/09/23.
//

import Foundation


enum NetworkError: Error {
    case networkErrorFail
    case invalidResponse
    case parsingError
}


protocol NetworkServiceProtocol {
    func request<T: Decodable>(type: T.Type, url: URL?, completionHandler: @escaping ((Result<T, NetworkError>) -> Void))
}

class NetworkService: NetworkServiceProtocol {
    
    func request<T: Decodable>(type: T.Type, url: URL?, completionHandler: @escaping ((Result<T, NetworkError>) -> Void)) {
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completionHandler(.failure(.networkErrorFail))
                return
            }
            do {
                let responseData = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(responseData.self))
            } catch (let error) {
                print(error.localizedDescription)
                completionHandler(.failure(.parsingError))
            }
        }.resume()
    }
}
