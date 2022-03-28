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
    private var buttonTopConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.white

        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.contentMode = UIView.ContentMode.scaleAspectFill
        profileImageView.image = UIImage(named: "profilePhoto.jpeg")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(profileImageView)

        userNameLabel.textColor = UIColor.black
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        userNameLabel.text = "Михаил"
        userNameLabel.textAlignment = .left
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(userNameLabel)

        statusLabel.textColor = UIColor.systemGray
        statusLabel.font = UIFont.systemFont(ofSize: 14.0)
        statusLabel.text = statusText
        statusLabel.textAlignment = .left
        statusLabel.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(statusLabel)

        statusTextField.borderStyle = UITextField.BorderStyle.roundedRect
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.clipsToBounds = true
        statusTextField.backgroundColor = UIColor.white
        statusTextField.textColor = UIColor.black
        statusTextField.font = UIFont.systemFont(ofSize: 15.0)
        statusTextField.isHidden = true

        statusTextField.addTarget(self, action: #selector(self.statusTextChangedAction), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(statusTextField)

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

        self.buttonTopConstraint =  self.statusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16)
        self.buttonTopConstraint?.priority = UILayoutPriority(999)

        NSLayoutConstraint.activate([
            profileImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),

            statusButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            self.buttonTopConstraint,
            statusButton.heightAnchor.constraint(equalToConstant: 50),

            userNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 16),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),

            statusLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -18),
            statusLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 16),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 7),
            statusTextField.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 16),
            statusTextField.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            titleButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            titleButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            titleButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            titleButton.heightAnchor.constraint(equalToConstant: 20)
        ].compactMap({ $0 }))

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func statusButtonPressedAction(_ sender: UIButton!) {
        if self.statusTextField.isHidden{
            self.buttonTopConstraint?.isActive = false
            self.buttonTopConstraint =  self.statusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 36)
            NSLayoutConstraint.activate([self.buttonTopConstraint].compactMap({ $0 }))
            statusButton.setTitle("Изменить статус", for: UIControl.State.normal)
        } else{
            self.buttonTopConstraint?.isActive = false
            self.buttonTopConstraint =  self.statusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16)
            NSLayoutConstraint.activate([self.buttonTopConstraint].compactMap({ $0 }))
            // Скрываем клавиатуру
            self.endEditing(true)
            // Присваиваем текст свойству класса
            statusLabel.text = statusText
            // Сдвигаем кнопку = прячем поле ввода
            statusButton.setTitle("Показать статус", for: UIControl.State.normal)
        }

        UIView.animate(withDuration: 1.0) {
            self.layoutIfNeeded()
        } completion: { _ in
            print(self.statusText)
            self.statusTextField.isHidden.toggle()
        }
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
