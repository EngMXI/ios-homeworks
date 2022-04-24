//
//  InfoViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 16.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let alertButton = UIButton(type: UIButton.ButtonType.system) //as UIButton
        
        alertButton.frame = CGRect(x:90, y:200, width:150, height:50)
        alertButton.backgroundColor = UIColor.yellow
        alertButton.setTitle("Сообщение", for: UIControl.State.normal)
        alertButton.tintColor = UIColor.black
        
        alertButton.addTarget(self, action: #selector(self.alertButtonAction), for: .touchUpInside)
        
        alertButton.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin]
        
        self.view.addSubview(alertButton)
        // Do any additional setup after loading the view.
    }
    
    @objc func alertButtonAction(_ sender:UIButton!)
    {
        let myAlertController = UIAlertController(title: "Какое-то соообщение", message: "Здесь могла бы быть ваша реклама", preferredStyle: .alert)
        
        let yesAlertAction = UIAlertAction(title: "Да", style: .default) { (action) -> Void in
            print("Нажата кнопка \"Да\"")
        }
        
        let noAlertAction = UIAlertAction(title: "Нет", style: .default) { (action) -> Void in
            print("Нажата кнопка \"Нет\"")
        }
        
        myAlertController.addAction(yesAlertAction)
        myAlertController.addAction(noAlertAction)
        
        self.present(myAlertController, animated: true, completion: nil)
        
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
