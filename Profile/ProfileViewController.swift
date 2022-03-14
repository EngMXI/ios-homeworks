//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 13.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let myProfileHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 320, height: 367))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        view.addSubview(myProfileHeaderView)

    }

    override func viewWillLayoutSubviews() {
        //view.subviews[0].frame = view.frame
        view.frame = CGRect(x: 0, y: 64, width: 320, height: 367)
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
