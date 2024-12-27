//
//  PostCardCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 13/12/24.
//

import UIKit

class PostCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PostCardCollectionViewCell"
    
    private var screen: PostCardCollectionViewCellScreen = PostCardCollectionViewCellScreen()
    
    //ViewModel Criada como opcional para setar valores na setupCell
    var ViewModel: PostCardViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configScreen()
        screen.configProtocoolCollectionView(delegate: self, dataSource: self)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen(){
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }

    public func setupCell(listPosts: [Posts] ){
        ViewModel = PostCardViewModel(listPost:listPosts)
    }

    
}

extension PostCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ViewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let view = ViewModel else { return UICollectionViewCell()}
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell
        
        cell?.setupCell(data: view.PostItems(indexPath: indexPath))
    
        return cell ?? UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 450)
    }
    
    
    
}
