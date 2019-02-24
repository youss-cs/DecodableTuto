//
//  AnimeCell.swift
//  DecodableTuto
//
//  Created by YouSS on 2/23/19.
//  Copyright © 2019 YouSS. All rights reserved.
//

import UIKit

class AnimeCell : UITableViewCell {
    
    var anime: Anime? {
        didSet {
            guard let imageUrl = anime?.image_url else { return }
            photoImageView.loadImage(imageUrl: imageUrl)
            title.text = anime?.title
            desc.text = anime?.synopsis
        }
    }
    
    var photoImageView : CustomImageView = {
        let image = CustomImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    var title : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    
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
        addSubview(photoImageView)
        addSubview(title)
        addSubview(desc)
        photoImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .init(width: 80, height: 80))
        title.anchor(top: topAnchor, leading: photoImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        desc.anchor(top: title.bottomAnchor, leading: title.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 10))
    }
}
