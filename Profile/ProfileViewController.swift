//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 13.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let myProfileHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 91, width: 390, height: 367))

    override func viewDidLoad() {
        super.viewDidLoad()

        myProfileHeaderView.backgroundColor = UIColor.lightGray
        myProfileHeaderView.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleWidth]
        view.addSubview(myProfileHeaderView)

    }
    override func viewWillLayoutSubviews() {

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
