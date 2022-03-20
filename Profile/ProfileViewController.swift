//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 13.02.2022.
//
import UIKit

class ProfileViewController: UIViewController {

    let myProfileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        myProfileHeaderView .backgroundColor = UIColor.lightGray
        myProfileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myProfileHeaderView)

        NSLayoutConstraint.activate([
            myProfileHeaderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            myProfileHeaderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            myProfileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myProfileHeaderView.heightAnchor.constraint(equalToConstant: 220)
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
