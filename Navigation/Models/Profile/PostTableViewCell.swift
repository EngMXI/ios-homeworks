//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Михаил Усачев on 22.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private lazy var authorLabel : UILabel = {
        let authorLabel = UILabel()
        authorLabel.font = UIFont.systemFont(ofSize: 20.0)
        authorLabel.textColor = UIColor.black
        authorLabel.numberOfLines = 2// textContainer.maximumNumberOfLines = 2
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        return authorLabel
    }()

    private lazy var imageImageView : UIImageView = {
        let imageImageView = UIImageView()
        imageImageView.contentMode = .scaleAspectFit
        imageImageView.backgroundColor = UIColor.black
        imageImageView.translatesAutoresizingMaskIntoConstraints = false
        return imageImageView
    }()

    private lazy var descriptionLabel : UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 14.0)
        descriptionLabel.textColor = UIColor.systemGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()

    private lazy var likesLabel : UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 16.0)
        likesLabel.textColor = UIColor.black
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()

    private lazy var viewsLabel : UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = UIFont.systemFont(ofSize: 16.0)
        viewsLabel.textColor = UIColor.black
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(authorLabel)
        self.contentView.addSubview(imageImageView)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(likesLabel)
        self.contentView.addSubview(viewsLabel)


        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: 30),
            authorLabel.bottomAnchor.constraint(equalTo: imageImageView.topAnchor, constant: -12),

            imageImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            imageImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            imageImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            imageImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            imageImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -16),

            descriptionLabel.topAnchor.constraint(equalTo: imageImageView.bottomAnchor, constant: 16),
            descriptionLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.likesLabel.topAnchor, constant: -16),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            likesLabel.widthAnchor.constraint(equalToConstant: 100),
            likesLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.widthAnchor.constraint(equalToConstant: 150),
            viewsLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
        ])
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

    func setup (with post: Post){
        self.authorLabel.text = post.author
        self.imageImageView.image = UIImage(named: post.image)
        self.descriptionLabel.text = post.description
        self.likesLabel.text = "Лайков: \(post.likes)"
        self.viewsLabel.text = "Просмотров: \(post.views)"
    }

}
