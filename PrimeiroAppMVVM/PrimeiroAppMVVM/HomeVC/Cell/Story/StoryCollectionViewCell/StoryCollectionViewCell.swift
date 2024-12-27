//
//  StoryCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 05/12/24.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCollectionViewCell"
    
    var screen: StoryCollectionViewCellScreen = StoryCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ConfigScreen()
    }
    
    private func ConfigScreen(){
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    public func setupCell(data: Stories, indexPath: IndexPath) {
        screen.profileImageView.image = UIImage(named: data.image)
        screen.userNameLabel.text = data.userName
        screen.addButton.isHidden = indexPath.row == 0 ? false : true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
