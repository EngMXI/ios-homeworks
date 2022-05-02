//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Михаил Усачев on 12.03.2022.
//
import UIKit

protocol ProfileHeaderViewDelegate: AnyObject {
    func closeButtonPressedAction()
}

class ProfileHeaderView: UIView {

    weak var delegate: ProfileHeaderViewDelegate?

    private let profileImageDimensions: CGFloat = 100

    lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.layer.cornerRadius = profileImageDimensions / 2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.contentMode = UIView.ContentMode.scaleAspectFill
        profileImageView.image = UIImage(named: "profilePhoto.jpeg")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
    
    private lazy var userNameLabel: UILabel =  {
        let userNameLabel = UILabel()
        userNameLabel.textColor = UIColor.black
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        userNameLabel.text = "Михаил"
        userNameLabel.textAlignment = .left
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return userNameLabel
    }()

    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = UIColor.systemGray
        statusLabel.font = UIFont.systemFont(ofSize: 14.0)
        statusLabel.text = statusText
        statusLabel.textAlignment = .left
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()

    private lazy var statusButton: UIButton = {
        let statusButton = UIButton(type: UIButton.ButtonType.system)
        statusButton.layer.cornerRadius = 4

        statusButton.layer.shadowOffset.width = 4
        statusButton.layer.shadowOffset.height = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7

        statusButton.tintColor = UIColor.white
        statusButton.backgroundColor = UIColor.systemBlue

        //statusButton.setTitle("Показать статус", for: UIControl.State.normal)
        statusButton.setTitle("Изменить статус", for: UIControl.State.normal)

        statusButton.addTarget(self, action: #selector(self.statusButtonPressedAction), for: .touchUpInside)
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        return statusButton
    }()

    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.borderStyle = UITextField.BorderStyle.roundedRect
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.clipsToBounds = true
        statusTextField.backgroundColor = UIColor.white
        statusTextField.textColor = UIColor.black
        statusTextField.font = UIFont.systemFont(ofSize: 15.0)
        //statusTextField.isHidden = true
        statusTextField.addTarget(self, action: #selector(self.statusTextFieldTapped), for: .editingDidBegin)
        statusTextField.addTarget(self, action: #selector(self.statusTextChangedAction), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()

    private lazy var titleButton: UIButton = {
        let titleButton = UIButton(type: UIButton.ButtonType.system)
        titleButton.layer.cornerRadius = 4

        titleButton.layer.shadowOffset.width = 4
        titleButton.layer.shadowOffset.height = 4
        titleButton.layer.shadowColor = UIColor.black.cgColor
        titleButton.layer.shadowOpacity = 0.7

        titleButton.tintColor = UIColor.white
        titleButton.backgroundColor = UIColor.systemRed

        titleButton.setTitle("Заголовок", for: UIControl.State.normal)

        titleButton.translatesAutoresizingMaskIntoConstraints = false
        return titleButton
    }()

    private lazy var alphaView: UIView = {
        let alphaView = UIView()
        alphaView.backgroundColor = .white
        alphaView.alpha = 0
        //alphaView.isHidden = true
        alphaView.translatesAutoresizingMaskIntoConstraints = false
        return alphaView
    }()

    private lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: UIButton.ButtonType.system)
        closeButton.setImage(UIImage(systemName: "xmark"), for: UIControl.State.normal)
        closeButton.layer.cornerRadius = 25
        closeButton.tintColor = UIColor.white
        closeButton.backgroundColor = .systemGray
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(self.closeButtonPressedAction), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        return closeButton
    }()


    private lazy var statusText: String = "Ожидание чего-то..."

    private var buttonTopConstraint: NSLayoutConstraint?

    private var profileImageViewLeftConstraint: NSLayoutConstraint?
    private var profileImageViewTopConstraint: NSLayoutConstraint?
    private var profileImageViewHeightConstraint: NSLayoutConstraint?
    private var profileImageViewWidthConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.white
        self.addSubview(userNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(statusButton)
        self.addSubview(titleButton)

        self.addSubview(alphaView)
        self.addSubview(profileImageView)
        self.addSubview(closeButton)
        self.viewLayoutConstraitActivate()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func viewLayoutConstraitActivate(){

        self.profileImageViewLeftConstraint = self.profileImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16)
        self.profileImageViewTopConstraint = self.profileImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        self.profileImageViewHeightConstraint = self.profileImageView.heightAnchor.constraint(equalToConstant: profileImageDimensions)
        self.profileImageViewWidthConstraint = self.profileImageView.widthAnchor.constraint(equalToConstant: profileImageDimensions)

        self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: profileImageDimensions + 32)
        self.buttonTopConstraint?.priority = UILayoutPriority(999)

        NSLayoutConstraint.activate([
            profileImageViewLeftConstraint,
            profileImageViewTopConstraint,
            profileImageViewHeightConstraint,
            profileImageViewWidthConstraint,

            closeButton.topAnchor.constraint(equalTo: self.profileImageView.topAnchor, constant: 10),
            closeButton.rightAnchor.constraint(equalTo: self.profileImageView.rightAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.widthAnchor.constraint(equalToConstant: 50),

            statusButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            self.buttonTopConstraint,
            statusButton.heightAnchor.constraint(equalToConstant: 50),

            userNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: profileImageDimensions + 16),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),

            //statusLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: profileImageDimensions - 18),
            statusLabel.bottomAnchor.constraint(equalTo: self.statusButton.topAnchor, constant: -50),
            statusLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: profileImageDimensions + 16),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 0),
            statusTextField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: profileImageDimensions + 16),
            statusTextField.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            titleButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            titleButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            titleButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            titleButton.heightAnchor.constraint(equalToConstant: 20)
        ].compactMap({ $0 }))
    }

    @objc func statusButtonPressedAction(_ sender: UIButton!) {
        if statusTextField.text == "" {
            UIView.animate(withDuration: 0.5){
                self.statusTextField.backgroundColor = .systemPink
            }
        }
        else {
            // Скрываем клавиатуру
            self.endEditing(true)
            // Присваиваем текст свойству класса
            statusLabel.text = statusText
            print(self.statusText)
        }

    }

    func profileImageLarge(viewController: UIViewController){
        self.profileImageViewLeftConstraint?.isActive = false
        self.profileImageViewTopConstraint?.isActive = false
        self.profileImageViewHeightConstraint?.isActive = false
        self.profileImageViewWidthConstraint?.isActive = false

        // Чтобы при повороте экрана картинка не превышала область экрана
        let profileImageHeight = UIScreen.main.bounds.height > UIScreen.main.bounds.width ?  UIScreen.main.bounds.width :  UIScreen.main.bounds.height

        self.profileImageViewLeftConstraint = self.profileImageView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor)
        self.profileImageViewTopConstraint = self.profileImageView.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
        self.profileImageViewHeightConstraint = self.profileImageView.heightAnchor.constraint(equalToConstant: profileImageHeight)
        self.profileImageViewWidthConstraint = self.profileImageView.widthAnchor.constraint(equalToConstant: profileImageHeight)

        NSLayoutConstraint.activate([self.profileImageViewLeftConstraint,
                                     self.profileImageViewTopConstraint,
                                     self.profileImageViewHeightConstraint,
                                     self.profileImageViewWidthConstraint,

                                     alphaView.leftAnchor.constraint(equalTo: viewController.view.leftAnchor),
                                     alphaView.rightAnchor.constraint(equalTo: viewController.view.rightAnchor),
                                     alphaView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
                                     alphaView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)
                                    ].compactMap({ $0 }))

        self.alphaView.alpha = 0.85
        self.profileImageView.layer.cornerRadius = 0
    }
    
    func closeButtonShow() {
        self.closeButton.alpha = 1
    }

    func closeButtonHide() {
        self.closeButton.alpha = 0
    }

    func profileImageSmall(){
        self.profileImageView.layer.cornerRadius = profileImageDimensions / 2
        self.alphaView.alpha = 0

        self.profileImageViewLeftConstraint?.isActive = false
        self.profileImageViewTopConstraint?.isActive = false
        self.profileImageViewHeightConstraint?.isActive = false
        self.profileImageViewWidthConstraint?.isActive = false

        self.profileImageViewLeftConstraint = self.profileImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16)
        self.profileImageViewTopConstraint = self.profileImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        self.profileImageViewHeightConstraint = self.profileImageView.heightAnchor.constraint(equalToConstant: profileImageDimensions)
        self.profileImageViewWidthConstraint = self.profileImageView.widthAnchor.constraint(equalToConstant: profileImageDimensions)

        NSLayoutConstraint.activate([self.profileImageViewLeftConstraint,
                                     self.profileImageViewTopConstraint,
                                     self.profileImageViewHeightConstraint,
                                     self.profileImageViewWidthConstraint
                                    ].compactMap({ $0 }))
    }

    @objc func closeButtonPressedAction(_ sender: UIButton!) {
        delegate?.closeButtonPressedAction()
    }

    @objc func statusTextChangedAction(_ textField: UITextField) {
        self.statusText = textField.text ?? ""
        UIView.animate(withDuration: 0.5){
            self.statusTextField.backgroundColor = .white
        }
    }
    
    @objc func statusTextFieldTapped(_ sender: UITextField!) {
        UIView.animate(withDuration: 0.5){
            self.statusTextField.backgroundColor = .white
        }
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

}
