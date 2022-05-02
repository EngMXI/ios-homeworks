//
//  PhotoView.swift
//  Navigation
//
//  Created by Михаил Усачев on 23.04.2022.
//

import UIKit

protocol PhotoViewDelegate: AnyObject {
    func closeButtonPressedAction()
}

class PhotoView: UIView {
    
    weak var delegate: PhotoViewDelegate?
    
    lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.clipsToBounds = true
        photoImageView.layer.borderWidth = 3
        photoImageView.layer.borderColor = UIColor.white.cgColor
        photoImageView.contentMode = UIView.ContentMode.scaleAspectFill
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        return photoImageView
    }()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: UIButton.ButtonType.system)
        closeButton.setImage(UIImage(systemName: "xmark"), for: UIControl.State.normal)
        closeButton.layer.cornerRadius = 25
        closeButton.tintColor = UIColor.white
        closeButton.backgroundColor = .systemGray
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(self.closeButtonPressedAction), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        return closeButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(photoImageView)
        self.addSubview(closeButton)
        self.viewLayoutConstraitActivate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewLayoutConstraitActivate(){
        
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            photoImageView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            photoImageView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            
            closeButton.topAnchor.constraint(equalTo: self.photoImageView.topAnchor, constant: 10),
            closeButton.rightAnchor.constraint(equalTo: self.photoImageView.rightAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func showCloseButton(){
        self.closeButton.alpha = 1
    }
    
    func hideCloseButton(){
        self.closeButton.alpha = 0
    }
    
    @objc func closeButtonPressedAction(_ sender: UIButton!) {
        delegate?.closeButtonPressedAction()
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
