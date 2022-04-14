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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Фотогаллерея"
        self.view.addSubview(photosCollectionView)
        
       NSLayoutConstraint.activate([
            photosCollectionView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            photosCollectionView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            photosCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8),
            photosCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
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

extension PhotosViewController: //UICollectionViewDelegate,
    UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

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
    
}
