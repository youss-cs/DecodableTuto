//
//  DetailAnimeHeaderCell.swift
//  DecodableTuto
//
//  Created by YouSS on 2/23/19.
//  Copyright © 2019 YouSS. All rights reserved.
//

import UIKit

class DetailAnimeHeaderCell: UITableViewHeaderFooterView {
    
    var animeViewModel: AnimeViewModel? {
        didSet {
            guard let imageUrl = animeViewModel?.imageUrl else { return }
            photoImageView.loadImage(imageUrl: imageUrl)
        }
    }
    
    let photoImageView: CustomImageView = {
        let image = CustomImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(photoImageView)
        photoImageView.fillSuperview()
    }
}
