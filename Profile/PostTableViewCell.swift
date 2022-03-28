//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Михаил Усачев on 22.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private lazy var authorTextView : UITextView = {
        let authorTextView = UITextView()
        authorTextView.font = UIFont.systemFont(ofSize: 20.0)
        authorTextView.textColor = UIColor.black
        authorTextView.textContainer.maximumNumberOfLines = 2
        authorTextView.translatesAutoresizingMaskIntoConstraints = false
        return authorTextView
    }()

    private lazy var imageImageView : UIImageView = {
        let imageImageView = UIImageView()
        imageImageView.contentMode = .scaleAspectFit
        imageImageView.backgroundColor = UIColor.black
        imageImageView.translatesAutoresizingMaskIntoConstraints = false
        return imageImageView
    }()

    private lazy var descriptionTextView : UITextView = {
        let descriptionTextView = UITextView()
        descriptionTextView.font = UIFont.systemFont(ofSize: 14.0)
        descriptionTextView.textColor = UIColor.systemGray
        descriptionTextView.textContainer.maximumNumberOfLines = 0
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionTextView
    }()

    private lazy var likesTextView : UITextView = {
        let likesTextView = UITextView()
        likesTextView.font = UIFont.systemFont(ofSize: 16.0)
        likesTextView.textColor = UIColor.black
        likesTextView.translatesAutoresizingMaskIntoConstraints = false
        return likesTextView
    }()

    private lazy var viewsTextView : UITextView = {
        let viewsTextView = UITextView()
        viewsTextView.font = UIFont.systemFont(ofSize: 16.0)
        viewsTextView.textColor = UIColor.black
        viewsTextView.translatesAutoresizingMaskIntoConstraints = false
        return viewsTextView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(authorTextView)
        self.contentView.addSubview(imageImageView)
        self.contentView.addSubview(descriptionTextView)
        self.contentView.addSubview(likesTextView)
        self.contentView.addSubview(viewsTextView)


        NSLayoutConstraint.activate([
            authorTextView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            authorTextView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            authorTextView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            //authorTextView.bottomAnchor.constraint(equalTo: imageImageView.topAnchor, constant: -30),
            authorTextView.heightAnchor.constraint(equalToConstant: 60),

            imageImageView.topAnchor.constraint(equalTo: authorTextView.bottomAnchor, constant: 12),
            imageImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            imageImageView.leftAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leftAnchor),
            imageImageView.rightAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.rightAnchor),

            descriptionTextView.topAnchor.constraint(equalTo: imageImageView.bottomAnchor, constant: 16),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 100),
            descriptionTextView.leftAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            descriptionTextView.rightAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.rightAnchor, constant: -16),

            likesTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 16),
            likesTextView.heightAnchor.constraint(equalToConstant: 40),
            likesTextView.leftAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            likesTextView.widthAnchor.constraint(equalToConstant: 100),

            viewsTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 16),
            viewsTextView.heightAnchor.constraint(equalToConstant: 40),
            viewsTextView.widthAnchor.constraint(equalToConstant: 150),
            viewsTextView.rightAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.rightAnchor, constant: -16)

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
        self.authorTextView.text = post.author
        self.imageImageView.image = UIImage(named: post.image)
        self.descriptionTextView.text = post.description
        self.likesTextView.text = "Лайков: \(post.likes)"
        self.viewsTextView.text = "Просмотров: \(post.views)"
    }

}
