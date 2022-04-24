//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Михаил Усачев on 03.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private var photosDataSource: [String] = myImages
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var photosCollectionView: UICollectionView = {
        let photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        photosCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCell")
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return photosCollectionView
    }()
    
    private lazy var photoView: PhotoView = {
        let photoView = PhotoView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.backgroundColor = .white
        photoView.alpha = 0
        photoView.delegate = self
        return photoView
    }()
    
    private lazy var alphaView: UIView = {
        let alphaView = UIView()
        alphaView.translatesAutoresizingMaskIntoConstraints = false
        alphaView.backgroundColor = .white
        alphaView.alpha = 0
        return alphaView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Фотогаллерея"
        self.view.addSubview(photosCollectionView)
        self.view.addSubview(alphaView)
        self.view.addSubview(photoView)
        
        let imageHeight = UIScreen.main.bounds.height > UIScreen.main.bounds.width ?  UIScreen.main.bounds.width :  UIScreen.main.bounds.height
        
        NSLayoutConstraint.activate([
            photosCollectionView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            photosCollectionView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            photosCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8),
            photosCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            alphaView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            alphaView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            alphaView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            photoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            photoView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            photoView.heightAnchor.constraint(equalToConstant: imageHeight),
            photoView.widthAnchor.constraint(equalToConstant: imageHeight)
            
        ])
        // Do any additional setup after loading the view.
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 2 * spacing
        let itemWidth = floor(neededWidth / 3)
        return CGSize(width: itemWidth, height: itemWidth)
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

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PhotoViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            cell.backgroundColor = .systemMint
            return cell
        }
        cell.backgroundColor = .black
        let photo = self.photosDataSource[indexPath.row]
        cell.setup(with: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotosCollectionViewCell
        self.photoView.photoImageView.image = cell.photosImageView.image
        UIView.animate(withDuration: 0.5, animations: {
            self.photoView.alpha = 1
            self.alphaView.alpha = 0.85
            self.photoView.layoutIfNeeded()
            self.alphaView.layoutIfNeeded()
        }, completion: {_ in UIView.animate(withDuration: 0.3){
            self.photoView.showCloseButton()
            self.photoView.layoutIfNeeded()
        }
        })
    }
    
    func closeButtonPressedAction() {
        UIView.animate(withDuration: 0.3, animations: {
            self.photoView.hideCloseButton()
            self.photoView.layoutIfNeeded()
        }, completion: {_ in UIView.animate(withDuration: 0.5){
            self.photoView.alpha = 0
            self.alphaView.alpha = 0
            self.photoView.layoutIfNeeded()
            self.alphaView.layoutIfNeeded()
        }
        })
    }
    
}
