//
//  Season.swift
//  DecodableTuto
//
//  Created by YouSS on 2/23/19.
//  Copyright © 2019 YouSS. All rights reserved.
//

import Foundation

struct Season: Decodable {
    var season_name: String?
    var season_year: Int?
    var anime: [Anime]?
}
