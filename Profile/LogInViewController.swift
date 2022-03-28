//
//  LogInViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 16.03.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let colorSet: Set<UIColor> = [UIColor.init(hexString: "#4885CC")]
    private let accentColor = UIColor.init(hexString: "4885CC")

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 320, height: 520)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private func textFieldSettings (_ textField: UITextField) {
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.backgroundColor = UIColor.systemGray6
        textField.textColor = UIColor.black
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.tintColor =  accentColor
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
    }

    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.clipsToBounds = true
        logoImageView.contentMode = UIView.ContentMode.scaleToFill
        logoImageView.image = UIImage(named: "logo.png")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        return logoImageView
    }()

    private lazy var logInTextField: UITextField = {
        let logInTextField = UITextField()
        textFieldSettings(logInTextField)
        logInTextField.placeholder = "E-mail или телефон"
        logInTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return logInTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        textFieldSettings(passwordTextField)
        passwordTextField.placeholder = "Пароль"
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()

    private lazy var logInButton: UIButton = {
        let logInButton = UIButton(type: UIButton.ButtonType.system)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel.png"), for: UIControl.State.normal)
        logInButton.clipsToBounds = true
        logInButton.tintColor = UIColor.white
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("Log In", for: UIControl.State.normal)
        logInButton.addTarget(self, action: #selector(self.logInButtonPressedAction), for: .touchUpInside)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        return logInButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true

        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(logoImageView)
        self.contentView.addSubview(logInTextField)
        self.contentView.addSubview(passwordTextField)
        self.contentView.addSubview(logInButton)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),

            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),

            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            logInTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            logInTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            logInTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            logInTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            passwordTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            logInButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @IBAction func logInButtonPressedAction(_ sender: UIButton!) {
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem.title = "Профиль"
        profileNavigationController.tabBarItem.image = UIImage(systemName: "person")
        profileViewController.title = profileNavigationController.tabBarItem.title
        self.tabBarController?.viewControllers?[1] = profileNavigationController
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // подписаться на уведомления
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(self.kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(self.kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // отписаться от уведомлений
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // Изменение отступов при появлении клавиатуры
    @IBAction private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    @IBAction private func kbdHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
