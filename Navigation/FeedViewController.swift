//
//  FeedViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 13.02.2022.
//

import UIKit

struct Post {
    let title: String
}


class FeedViewController: UIViewController {

    let anyPost = Post(title: "Какой-то пост")

    override func viewDidLoad() {
        super.viewDidLoad()

        let postButton = UIButton(type: UIButton.ButtonType.system) //as UIButton

        postButton.frame = CGRect(x:90, y:100, width:150, height:50)
        postButton.backgroundColor = UIColor.green
        postButton.setTitle("Показать пост", for: UIControl.State.normal)
        postButton.tintColor = UIColor.black

        postButton.addTarget(self, action: #selector(self.postButtonAction), for: .touchUpInside)

        postButton.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin]

        self.view.addSubview(postButton)


    }
    @IBAction func postButtonAction(_ sender:UIButton!)
    {
        print("Переход")
        let postViewController = PostViewController()
        postViewController.post = anyPost
        show(postViewController, sender: self)
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
