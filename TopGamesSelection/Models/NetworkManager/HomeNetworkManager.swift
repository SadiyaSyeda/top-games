//
//  HomeNetworkManager.swift
//  TopGamesSelection
//
//  Created by Sadiya Syeda on 9/10/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import Foundation

class HomeNetworkManager {
    static let shared = HomeNetworkManager()
    let urlString : String = ApplicationEnvironment.url.rawValue + EndPoint.topGames.rawValue
    let bodyParameters = [ApiRequestKeys.limit.rawValue : ApiRequestValues.limitValue.rawValue]

    func fetchGames(completion : @escaping([String]) -> Void){
        var largeImageURLS : [String] = []
        guard let url = URL(string: urlString) else{
            assertionFailure("url returned nil value")
            return
        }
        
        let parameters : [String : Any] = bodyParameters
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        
        var urlRequest = URLRequest(url:url)
        urlRequest.setValue(ApiHeaderValues.clientIdValue.rawValue, forHTTPHeaderField: ApiHeaderKeys.clientID.rawValue)
        urlRequest.httpBody = jsonData
        urlRequest.httpMethod = "GET"
        
        
        URLSession.shared.dataTask (with: urlRequest) { (data, urlResponse, error) in
            guard let  data = data, urlResponse != nil, error == nil else{
                print("something wrong")
                return
            }
        
            do{
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(TopGamesSelection.self, from: data)
                guard let topGames = decodedData.top else{
                    assertionFailure("Couldnt retrieve games")
                    return
                }
                
                for top in topGames{
                    guard let largeImageUrls = top.game?.box?.large else{
                        assertionFailure("Couldnt get images")
                        return
                    }
                    largeImageURLS.append(largeImageUrls)
                }
                completion(largeImageURLS)
            }
            catch{
                print("something went wrong")
            }
        }.resume()
    }
}
