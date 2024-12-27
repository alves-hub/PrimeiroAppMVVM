//
//  UiView + Extension.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 15/11/24.
//

import Foundation
import UIKit

extension UIView {
    
    public func setCardShadow(){
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 8
        layer.shouldRasterize = true
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    public func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
        
        ])
      
    }
    
}
