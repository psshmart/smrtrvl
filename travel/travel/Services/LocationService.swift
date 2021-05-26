//
//  LocationService.swift
//  travel
//
//  Created by Svetlana Safonova on 17.05.2021.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif


class LocationService {
    
    let queue = DispatchQueue.global(qos: .userInitiated)
    
    func requestMeth(completion: @escaping (Result<[Country], Error>) -> Void) {
        let semaphore = DispatchSemaphore(value: 0)


        var request = URLRequest(url: URL(string: "https://countriesnow.space/api/v0.1/countries")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        queue.async {
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    semaphore.signal()
                    completion(.failure(error!))
                    return
                }
                let decoder = JSONDecoder()
                
                if let countries = try? decoder.decode(Countries.self, from: data) {
                    completion(.success(countries.data))
                }
                semaphore.signal()
            }
            task.resume()
            semaphore.wait()
        }
    
    }
    
}




