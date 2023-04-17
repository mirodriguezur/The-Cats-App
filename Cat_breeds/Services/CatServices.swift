//
//  Services.swift
//  Cat_breeds
//
//  Created by Michael Alexander Rodriguez Urbina on 16/04/23.
//

import Foundation

class CatServices {
    private let apiKey = "bda53789-d59e-46cd-9bc4-2936630fde39"
    private let host = "api.thecatapi.com"
    private let path = "/v1/breeds"
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadCatInformationResult
    
    public func load(completion: @escaping (Result) -> Void) {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = host
        urlBuilder.path = path
        urlBuilder.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let url = urlBuilder.url!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Failed request from thecatapi: \(error!.localizedDescription)")
                completion(.failure(Error.connectivity))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Unable to process thecatapi response")
                completion(.failure(Error.connectivity))
                return
            }
            
            guard response.statusCode == 200 else {
                print("Failure response from thecatapi: \(response.statusCode)")
                completion(.failure(Error.connectivity))
                return
            }
            
            guard let data = data else {
              print("No data returned from thecatapi")
              completion(.failure(Error.invalidData))
              return
            }
            
            do {
              let root = try JSONDecoder().decode(Root.self, from: data)
                completion(.success(root.items))
            } catch {
              print("Unable to decode thecatapi response: \(error.localizedDescription)")
              completion(.failure(Error.invalidData))
            }
        }
    }
}

private struct Root: Decodable {
    let items: [Cat]
}
