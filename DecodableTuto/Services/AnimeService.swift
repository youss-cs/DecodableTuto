//
//  AnimeService.swift
//  DecodableTuto
//
//  Created by YouSS on 2/23/19.
//  Copyright © 2019 YouSS. All rights reserved.
//

import Foundation

class AnimeService {
    static let instance = AnimeService()
    
    func getAnimes(completion: @escaping ([Anime]) -> Void) {
        guard let url = URL(string: baseURL + "season/2019/winter") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
               
                let season = try JSONDecoder().decode(Season.self, from: data)
                guard let animes = season.anime else { return }
                
                DispatchQueue.main.async {
                    completion(animes)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
}
