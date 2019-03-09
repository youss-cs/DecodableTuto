//
//  AnimeViewModel.swift
//  DecodableTuto
//
//  Created by YouSS on 3/9/19.
//  Copyright © 2019 YouSS. All rights reserved.
//

import UIKit

struct AnimeViewModel {
    let imageUrl: String?
    let title: String?
    let desc: String?
    
    init(anime: Anime) {
        imageUrl = anime.image_url
        title = anime.title
        desc = anime.synopsis
    }
}
