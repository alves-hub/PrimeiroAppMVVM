//
//  PostCardCollectionViewCellScreen.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 13/12/24.
//

import UIKit

class PostCardCollectionViewCellScreen: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.contentInset = .init(top: 5, left: 0, bottom: 5, right: 0)
        //TO DO: Register cell
        cv.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)

        cv.backgroundColor = .clear
        return cv
    }()
    
    
    public func configProtocoolCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func addElements(){
        addSubview(collectionView)
        collectionView.pin(to: self)
    }
    
}
