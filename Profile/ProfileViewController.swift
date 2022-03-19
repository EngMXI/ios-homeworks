//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 13.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let myProfileHeaderView = ProfileHeaderView()//(frame: CGRect(x: 0, y: 0, width: 375, height: 367))

    override func viewDidLoad() {
        super.viewDidLoad()
        myProfileHeaderView.backgroundColor = UIColor.lightGray
        myProfileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(myProfileHeaderView)

        NSLayoutConstraint.activate([
            myProfileHeaderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            myProfileHeaderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            myProfileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myProfileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    override func viewWillLayoutSubviews() {
        myProfileHeaderView.frame = view.frame// = CGRect(x: 0, y: 64, width: 375, height: 367)
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
