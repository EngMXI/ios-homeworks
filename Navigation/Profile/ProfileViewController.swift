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
        myTableView.estimatedRowHeight = 0
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        return myTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myTableView)

        let tableHeaderView = ProfileHeaderView()
        tableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        self.myTableView.tableHeaderView = tableHeaderView

        NSLayoutConstraint.activate([
            myTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            myTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            myTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),

            tableHeaderView.widthAnchor.constraint(equalTo: self.myTableView.widthAnchor),
            tableHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
        self.myTableView.tableHeaderView?.layoutIfNeeded()
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
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource, PhotosTableViewCellDelegate {

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
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->CGFloat {
        if indexPath.section == 1 {
            return 650
        } else {
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            if screenHeight > screenWidth {
                return (screenWidth-48)/4 + 66
            } else {
                return (screenHeight-48)/4 + 66
            }
        }
    }

    func photosButtonPressedAction() {
        let newPhotosViewController = PhotosViewController()
        self.navigationController?.pushViewController(newPhotosViewController, animated: true)
    }
}
