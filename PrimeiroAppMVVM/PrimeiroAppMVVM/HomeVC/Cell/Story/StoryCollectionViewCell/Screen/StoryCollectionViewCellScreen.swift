//
//  StoryCollectionViewCellScreen.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 05/12/24.
//

import UIKit

class StoryCollectionViewCellScreen: UIView {

 
    lazy var profileImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
        return img
        
    }()
    
    lazy var addButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        // Inserindo imagem no btn e renderinmode = template para pode modificar botao
        btn.setBackgroundImage(UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .blue
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 12.5
        return btn
    }()
    
    lazy var userNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        lbl.textColor = .black
        
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addElement()
        self.configContranits()
        
    }
    
    private func addElement(){
        addSubview(profileImageView)
        addSubview(addButton)
        addSubview(userNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContranits(){
        NSLayoutConstraint.activate([
        
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            
            addButton.widthAnchor.constraint(equalToConstant: 25),
            addButton.heightAnchor.constraint(equalToConstant: 25),
            addButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            addButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        
        ])
    }
    
}
