//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Михаил Усачев on 12.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private let profileImageView = UIImageView()
    private let userNameLabel = UILabel()
    private let statusLabel = UILabel()
    private let statusButton = UIButton(type: UIButton.ButtonType.system)
    private let statusTextField = UITextField()
    private var statusText: String = "Ожидание чего-то..."
    private let titleButton = UIButton(type: UIButton.ButtonType.system)

    override init(frame: CGRect) {
        super.init(frame: frame)

        profileImageView.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.contentMode = UIView.ContentMode.scaleAspectFill
        profileImageView.image = UIImage(named: "profilePhoto.jpeg")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(profileImageView)

        userNameLabel.frame = CGRect(x: 132, y: 27, width: 182, height: 20)
        userNameLabel.textColor = UIColor.black
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        userNameLabel.text = "Михаил"
        userNameLabel.textAlignment = .left
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(userNameLabel)

        statusLabel.frame = CGRect(x: 132, y: 78, width: 182, height: 20)
        statusLabel.textColor = UIColor.systemGray
        statusLabel.font = UIFont.systemFont(ofSize: 14.0)
        statusLabel.text = statusText
        statusLabel.textAlignment = .left
        statusLabel.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(statusLabel)

        statusButton.frame = CGRect(x:16, y:132, width:288, height:50)
        statusButton.layer.cornerRadius = 4

        statusButton.layer.shadowOffset.width = 4
        statusButton.layer.shadowOffset.height = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7

        statusButton.tintColor = UIColor.white
        statusButton.backgroundColor = UIColor.systemBlue

        statusButton.setTitle("Показать статус", for: UIControl.State.normal)

        statusButton.addTarget(self, action: #selector(self.statusButtonPressedAction), for: .touchUpInside)
        statusButton.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(statusButton)

        statusTextField.frame = CGRect(x:132, y:98, width:182, height:30)
        statusTextField.borderStyle = UITextField.BorderStyle.roundedRect
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.clipsToBounds = true
        statusTextField.backgroundColor = UIColor.white
        statusTextField.textColor = UIColor.black
        statusTextField.font = UIFont.systemFont(ofSize: 15.0)

        statusTextField.addTarget(self, action: #selector(self.statusTextChangedAction), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(statusTextField)

        titleButton.frame = CGRect(x:16, y:132, width:288, height:50)
        titleButton.layer.cornerRadius = 4

        titleButton.layer.shadowOffset.width = 4
        titleButton.layer.shadowOffset.height = 4
        titleButton.layer.shadowColor = UIColor.black.cgColor
        titleButton.layer.shadowOpacity = 0.7

        titleButton.tintColor = UIColor.white
        titleButton.backgroundColor = UIColor.systemRed

        titleButton.setTitle("Заголовок", for: UIControl.State.normal)

        titleButton.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(titleButton)

        NSLayoutConstraint.activate([
            profileImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),

            statusButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),

            userNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 16),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),

            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            statusLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 16),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),

            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -4),
            statusTextField.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 16),
            statusTextField.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 30),

            titleButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            titleButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            titleButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            titleButton.heightAnchor.constraint(equalToConstant: 20)
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func statusButtonPressedAction(_ sender: UIButton!) {
        print(statusText)
        statusLabel.text = statusText
    }

    @IBAction func statusTextChangedAction(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
