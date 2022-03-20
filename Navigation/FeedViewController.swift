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

        let feedStackView = UIStackView()

        feedStackView.backgroundColor = UIColor.systemGray
        feedStackView.axis = .vertical
        feedStackView.spacing = 10
        feedStackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(feedStackView)

        let firstPostButton = UIButton(type: UIButton.ButtonType.system)

        firstPostButton.backgroundColor = UIColor.systemBlue
        firstPostButton.setTitle("Показать пост", for: UIControl.State.normal)
        firstPostButton.tintColor = UIColor.white

        firstPostButton.addTarget(self, action: #selector(self.postButtonAction), for: .touchUpInside)

        feedStackView.addArrangedSubview(firstPostButton)

        let secondPostButton = UIButton(type: UIButton.ButtonType.system)

        secondPostButton.backgroundColor = UIColor.systemBlue
        secondPostButton.setTitle("Тоже показать пост", for: UIControl.State.normal)
        secondPostButton.tintColor = UIColor.white

        secondPostButton.addTarget(self, action: #selector(self.postButtonAction), for: .touchUpInside)

        feedStackView.addArrangedSubview(secondPostButton)

        NSLayoutConstraint.activate([
            feedStackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            feedStackView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            feedStackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            feedStackView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, constant: -32),
            firstPostButton.heightAnchor.constraint(equalToConstant: 50),
           // secondPostButton.heightAnchor.constraint(equalToConstant: 50)
        ])
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
