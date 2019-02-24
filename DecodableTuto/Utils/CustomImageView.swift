//
//  CustomImageView.swift
//  DecodableTuto
//
//  Created by YouSS on 2/23/19.
//  Copyright © 2019 YouSS. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    var imageCache = [String:UIImage]()
    var lastImageURL: String?
    
    func loadImage(imageUrl: String) {
        lastImageURL = imageUrl
        image = nil
        
        if let image = imageCache[imageUrl] {
            self.image = image
            return
        }
        
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to retrieve image", error)
            }
            
            guard let data = data else { return }
            if url.absoluteString != self.lastImageURL { return }
            
            let image = UIImage(data: data)
            self.imageCache[url.absoluteString] = image
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
