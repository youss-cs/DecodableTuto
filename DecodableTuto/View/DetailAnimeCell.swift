//
//  DetailAnimeCell.swift
//  DecodableTuto
//
//  Created by YouSS on 2/23/19.
//  Copyright © 2019 YouSS. All rights reserved.
//

import UIKit

class DetailAnimeCell : UITableViewCell {
    
    var anime: Anime? {
        didSet {
            desc.text = anime?.synopsis
            print(anime?.title)
            print(anime?.synopsis)
        }
    }
    
    
    
    var desc : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(desc)
        desc.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 15, left: 15, bottom: 0, right: 15))
    }
}

