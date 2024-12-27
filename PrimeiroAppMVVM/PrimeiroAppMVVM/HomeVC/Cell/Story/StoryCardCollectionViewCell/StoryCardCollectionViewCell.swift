//
//  StoryCardCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 16/11/24.
//

import UIKit

class StoryCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCardCollectionViewCell"
    
    private var viewModel: StoryCardViewModel?
 
    var screen: StoryCardCollectionViewCellScreen = StoryCardCollectionViewCellScreen()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configScren()
        screen.configProtocolCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    
    private func configScren(){
        
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    public func setupCell(listStory: [Stories]){
        viewModel  = StoryCardViewModel(listStory: listStory)
        
    }
    
}
extension StoryCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        viewModel?.numberOfItems ?? 0
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell
        guard let viewModel = viewModel else {return UICollectionViewCell()}
        
        cell?.setupCell(data: viewModel.loudCurrentStory(indexPath: indexPath), indexPath: indexPath)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
    
}
