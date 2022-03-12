//
//  PostViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 13.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    var post = Post(title: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = post.title
        view.backgroundColor = UIColor.cyan

        let newInfoBarButtonItem = UIBarButtonItem(title: "Новое", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.newInfoViewController))

        self.navigationItem.rightBarButtonItem = newInfoBarButtonItem

    }
    @IBAction func newInfoViewController(){
        let newInfoViewController = InfoViewController()
        newInfoViewController.title = "Информация"
        self.present(newInfoViewController, animated: true, completion: nil)
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
