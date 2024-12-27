//
//  PostCollectionViewCellScreen.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 20/12/24.
//

import UIKit

class PostCollectionViewCellScreen: UIView {

    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.setCardShadow()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    lazy var likeImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "like-selected")
        img.contentMode = .scaleAspectFill
        // pegando uma acao na imagem para exibir like
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLikeImageView))
        // quantidade de tap para interagir
        tap.numberOfTapsRequired = 1
        //Adicionando acao tap na imagem
        img.addGestureRecognizer(tap)
        // se have interacao com a imagem
        img.isUserInteractionEnabled = true
        // se img vai ficar oculta
        img.isHidden = true
        
        return img
    }()
    
    @objc func tappedLikeImageView(){
        self.likeImageView.isHidden = true
    }
    
    
    lazy var profileImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"img8.jpg")
        img.clipsToBounds = true
        img.layer.cornerRadius = 50
        //img.contentMode = .scaleAspectFill
        img.setCardShadow()
        return img
    }()

    lazy var userNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = ""
        lb.textColor = .black
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return lb
    }()
    
    lazy var postImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "")
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        img.contentMode = .scaleAspectFill
        // pegando uma acao na imagem para exibir like
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedPostImageView))
        // quantidade de tap para interagir
        tap.numberOfTapsRequired = 2
        //Adicionando acao tap na imagem
        img.addGestureRecognizer(tap)
        // se have interacao com a imagem
        img.isUserInteractionEnabled = true
        return img
    }()
    
    @objc func tappedPostImageView(){
        heartImageView.isHidden = false
        //Configuracao do modo de exibicao
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations:{
            // TODO:
            self.heartImageView.transform = .init(scaleX: 1.8, y: 1.8)
            self.postImageView.transform = .init(scaleX: 1.05, y: 1.05)
            self.likeImageView.center.y += 50
            // Desfazendo estado de animacao como conf. inicial
        } , completion: { finished in
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations:{
                self.postImageView.transform = .identity
                self.likeImageView.center.y -= 50
                self.likeImageView.isHidden = false
            })
                           
            self.heartImageView.transform = .identity
            self.heartImageView.isHidden = true
            
        })
        
        
    }
    
    lazy var heartImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        img.setCardShadow()
        img.image = UIImage(named:"white-heart")
        img.isHidden = true
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElement()
        self.configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addElement (){
        addSubview(cardView)
        cardView.addSubview(likeImageView)
        cardView.addSubview(userNameLabel)
        cardView.addSubview(profileImageView)
        cardView.addSubview(postImageView)
        cardView.addSubview(heartImageView)
    }
    
    public func configContraints(){
        NSLayoutConstraint.activate([
        
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        
            likeImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 19),
            likeImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            likeImageView.heightAnchor.constraint(equalToConstant: 25),
            likeImageView.widthAnchor.constraint(equalToConstant: 25),
            
            profileImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 25),
            profileImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            
            userNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 24),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: likeImageView.leadingAnchor, constant: -5),
            
            postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 17),
            postImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -7),
            postImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 7),
            postImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -7),
            
            heartImageView.centerXAnchor.constraint(equalTo: postImageView.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor),
            heartImageView.heightAnchor.constraint(equalToConstant: 70),
            heartImageView.widthAnchor.constraint(equalToConstant: 70),
            
            
        ])
    }

}
