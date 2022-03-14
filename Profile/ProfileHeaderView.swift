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
    private var statusText: String = "Waiting for something..."

    override init(frame: CGRect) {
        super.init(frame: frame)

        profileImageView.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.contentMode = UIView.ContentMode.scaleAspectFill
        profileImageView.image = UIImage(named: "profilePhoto.jpeg")

        self.addSubview(profileImageView)

        userNameLabel.frame = CGRect(x: 132, y: 27, width: 182, height: 20)
        userNameLabel.textColor = UIColor.black
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        userNameLabel.text = "Михаил"
        userNameLabel.textAlignment = .left

        self.addSubview(userNameLabel)

        statusLabel.frame = CGRect(x: 132, y: 78, width: 182, height: 20)
        statusLabel.textColor = UIColor.systemGray
        statusLabel.font = UIFont.systemFont(ofSize: 14.0)
        statusLabel.text = statusText
        statusLabel.textAlignment = .left

        self.addSubview(statusLabel)

        statusButton.frame = CGRect(x:16, y:132, width:288, height:50)
        statusButton.layer.cornerRadius = 4

        statusButton.layer.shadowOffset.width = 4
        statusButton.layer.shadowOffset.height = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7

        statusButton.tintColor = UIColor.white
        statusButton.backgroundColor = UIColor.systemBlue

        statusButton.setTitle("Show status", for: UIControl.State.normal)

        statusButton.addTarget(self, action: #selector(self.statusButtonPressedAction), for: .touchUpInside)

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

        self.addSubview(statusTextField)
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
