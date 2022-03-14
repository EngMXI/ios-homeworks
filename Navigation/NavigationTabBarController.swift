//
//  NavigationTabBarController.swift
//  Navigation
//
//  Created by Михаил Усачев on 13.02.2022.
//

import UIKit

class NavigationTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.backgroundColor = UIColor.white

        //Первый UINavigationController
        let feedViewController = FeedViewController()
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        feedNavigationController.tabBarItem.title = "Лента"
        feedNavigationController.tabBarItem.image = UIImage(systemName: "doc.plaintext")
        feedViewController.title = feedNavigationController.tabBarItem.title
    

        //Второй UINavigationController
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem.title = "Профиль"
        profileNavigationController.tabBarItem.image = UIImage(systemName: "person")
        profileViewController.title = "Профиль"//profileNavigationController.tabBarItem.title

        //Инициализируем viewControllers
        self.viewControllers = [feedNavigationController, profileNavigationController]

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
