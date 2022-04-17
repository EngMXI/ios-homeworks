//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 13.02.2022.
//
import UIKit

class ProfileViewController: UIViewController {

    private var postDataSource: [Post] = myPosts

    private lazy var myTableView: UITableView = {
        let myTableView = UITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        myTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosCell")
        myTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = 650
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        return myTableView
    }()

    private lazy var tableHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(myTableView)

        tableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        self.myTableView.tableHeaderView = tableHeaderView
        tableHeaderView.delegate = self

        NSLayoutConstraint.activate([

            myTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            myTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            myTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),

            tableHeaderView.widthAnchor.constraint(equalTo: self.myTableView.widthAnchor),
            tableHeaderView.heightAnchor.constraint(equalToConstant: 220),
            tableHeaderView.leftAnchor.constraint(equalTo: self.myTableView.leftAnchor),
            tableHeaderView.topAnchor.constraint(equalTo: self.myTableView.topAnchor)
        ])
        self.myTableView.tableHeaderView?.layoutIfNeeded()

        // Скрываем клавиатуру при нажатии в любом месте
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        view.addGestureRecognizer(tap)

        // Выполняем анимацию при нажатии на аватар
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped(tapGestureRecognizer:)))
        tableHeaderView.profileImageView.isUserInteractionEnabled = true
        tableHeaderView.profileImageView.addGestureRecognizer(tapGestureRecognizer)

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
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource, PhotosTableViewCellDelegate, ProfileHeaderViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return self.postDataSource.count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let post = self.postDataSource[indexPath.row]
        cell.setup(with: post)
        return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell", for: indexPath) as? PhotosTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            cell.delegate = self
            cell.setup()
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    // Обработка нажатия стрелки вправо в ячейке с фото
    func photosButtonPressedAction() {
        let newPhotosViewController = PhotosViewController()
        self.navigationController?.pushViewController(newPhotosViewController, animated: true)
    }
    // Обработка тап по изображению
    @objc func profileImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        hideKeyboard()
        UIView.animate(withDuration: 0.5, animations: {
            self.tableHeaderView.profileImageLarge(viewController: self)
            self.tableHeaderView.layoutIfNeeded()
        }, completion: {_ in UIView.animate(withDuration: 0.3){
                self.tableHeaderView.closeButtonShow()
                self.tableHeaderView.layoutIfNeeded()
            }
        })
        self.myTableView.isScrollEnabled = false
    }
    // Обработка нажатия кнопки с иконкой крестика
    func closeButtonPressedAction() {
        UIView.animate(withDuration: 0.3, animations: {
            self.tableHeaderView.closeButtonHide()
            self.tableHeaderView.layoutIfNeeded()
        }, completion: {_ in UIView.animate(withDuration: 0.5){
            self.tableHeaderView.profileImageSmall()
            self.tableHeaderView.layoutIfNeeded()
        }
        })
        self.myTableView.isScrollEnabled = true
    }
}
