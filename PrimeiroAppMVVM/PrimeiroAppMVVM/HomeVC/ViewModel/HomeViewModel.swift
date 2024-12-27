//
//  HomeViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 15/11/24.
//

import UIKit

class HomeViewModel {
    
    // Objetos sempre como private na model
    private var storylist = [
        Stories(image: "img1", userName: "Godines"),
        Stories(image: "img2", userName: "pops"),
        Stories(image: "img3", userName: "Kiko"),
        Stories(image: "img4", userName: "Madruga"),
        Stories(image: "img5", userName: "Chavinho"),
        Stories(image: "img6", userName: "chiquinha"),
        Stories(image: "img7", userName: "Florinda"),
        Stories(image: "img8", userName: "JeffDay"),]
    
    private var postList = [ 
        Posts(profileImage: "img2", userImage: "pops", postImage: "post1"),
        Posts(profileImage: "img8", userImage: "JeffDay", postImage: "post4"),
        Posts(profileImage: "img5", userImage: "Chavinho", postImage: "post3"),
        Posts(profileImage: "img7", userImage: "Florinda", postImage: "post2"),]
    
    public var getListStory: [Stories]{
        storylist
    }
    
    public var getListPost: [Posts]{
        postList
    }
    
    
    public var numberOfItems: Int {
        2
    }
    
    public func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize{
        if indexPath.row == 0 {
            CGSize(width: 120, height: frame.height)
        }else{
            CGSize(width: frame.width - 120, height: frame.height)
        }
        
    }

}
