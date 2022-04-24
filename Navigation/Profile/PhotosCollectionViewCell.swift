//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Михаил Усачев on 03.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    lazy var photosImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(photosImageView)
        
        NSLayoutConstraint.activate([
            photosImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            photosImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            photosImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            photosImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.photosImageView.image = nil
    }
    
    func setup(with image: String) {
        //self.photosImageView.backgroundColor = .black
        self.photosImageView.image = UIImage(named: image)
    }
    
}
