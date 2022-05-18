//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 11/05/22.
//

import UIKit
import FirebaseAuth

final class ProfileViewController: UIViewController {
    
    private var collectionView:UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    private func configureCollectionView(){
        let layOut = UICollectionViewFlowLayout()
        layOut.scrollDirection = .vertical
        layOut.sectionInset =  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layOut.itemSize = CGSize(width: self.view.width/3, height: self.view.height/3)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        guard let  collectionView = collectionView else {
            return
        }
        view.addSubview(collectionView)
    }
    
    private func  configureNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"gear"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(rightBarButtonTapped))
    }
    
    @objc private func rightBarButtonTapped(){
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:- COllectionView Delegate and Data Source
extension ProfileViewController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}
