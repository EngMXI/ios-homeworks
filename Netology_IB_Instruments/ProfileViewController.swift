//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Михаил Усачев on 07.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var customProfileView: ProfileView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let mySubView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? UIView {
            self.view.addSubview(mySubView)
        }
        // Do any additional setup after loading the view.
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
