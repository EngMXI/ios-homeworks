//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Михаил Усачев on 02.04.2022.
//

import UIKit

protocol PhotosTableViewCellDelegate: AnyObject {
    func photosButtonPressedAction()
}

class PhotosTableViewCell: UITableViewCell {

    weak var delegate: PhotosTableViewCellDelegate?

    private lazy var photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.text = "Фотографии"
        photosLabel.textColor = UIColor.black
        photosLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        return photosLabel
    }()

    private lazy var photosButton: UIButton = {
        let photosButton = UIButton()
        photosButton.setImage(UIImage(systemName: "arrow.right"), for: UIControl.State.normal)
        photosButton.tintColor = .black
        photosButton.addTarget(self, action: #selector(self.photosButtonPressedAction), for: .touchUpInside)
        photosButton.translatesAutoresizingMaskIntoConstraints = false
        return photosButton
    }()

    private lazy var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var fourthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(photosLabel)
        self.contentView.addSubview(photosButton)
        self.contentView.addSubview(firstImageView)
        self.contentView.addSubview(secondImageView)
        self.contentView.addSubview(thirdImageView)
        self.contentView.addSubview(fourthImageView)
        self.cellLayoutConstrait()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(){
        self.firstImageView.image = UIImage(named: "101")
        self.secondImageView.image = UIImage(named: "102")
        self.thirdImageView.image = UIImage(named: "103")
        self.fourthImageView.image = UIImage(named: "104")
    }

    @objc func photosButtonPressedAction(_ sender: UIButton!) {
        delegate?.photosButtonPressedAction()
    }

    func cellLayoutConstrait(){
        let imageDimensions = (UIScreen.main.bounds.width-48)/4

        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            photosLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12),
            photosLabel.widthAnchor.constraint(equalToConstant: 150),
            photosLabel.bottomAnchor.constraint(equalTo: firstImageView.topAnchor, constant: -12),

            photosButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            photosButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12),
            photosButton.widthAnchor.constraint(equalToConstant: 30),
            photosButton.bottomAnchor.constraint(equalTo: firstImageView.topAnchor, constant: -12),

            firstImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            firstImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12),
            firstImageView.heightAnchor.constraint(equalToConstant: imageDimensions),
            firstImageView.widthAnchor.constraint(equalToConstant: imageDimensions),
            firstImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),

            secondImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            secondImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: imageDimensions + 20),
            secondImageView.heightAnchor.constraint(equalToConstant: imageDimensions),
            secondImageView.widthAnchor.constraint(equalToConstant: imageDimensions),
            secondImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),

            thirdImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            thirdImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: imageDimensions * 2 + 28),
            thirdImageView.heightAnchor.constraint(equalToConstant: imageDimensions),
            thirdImageView.widthAnchor.constraint(equalToConstant: imageDimensions),
            thirdImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),

            fourthImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            fourthImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: imageDimensions * 3 + 36),
            fourthImageView.heightAnchor.constraint(equalToConstant: imageDimensions),
            fourthImageView.widthAnchor.constraint(equalToConstant: imageDimensions),
            fourthImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
        ])
    }
}
