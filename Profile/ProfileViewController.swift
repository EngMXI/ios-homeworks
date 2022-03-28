//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 13.02.2022.
//
import UIKit

class ProfileViewController: UIViewController {

    private var dataSource: [Post] = myPosts    

    private lazy var myTableView: UITableView = {
        let myTableView = UITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        myTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        myTableView.sectionHeaderHeight = 220
       // myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = 0
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        return myTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myTableView)

        NSLayoutConstraint.activate([
            myTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            myTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            myTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)

        ])
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
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileHeaderView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let post = self.dataSource[indexPath.row]
        cell.setup(with: post)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->CGFloat {
        return 650
    }
}
