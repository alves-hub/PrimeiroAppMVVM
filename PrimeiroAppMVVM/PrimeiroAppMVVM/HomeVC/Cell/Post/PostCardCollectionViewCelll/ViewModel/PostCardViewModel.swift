//
//  PostCardViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 20/12/24.
//

import UIKit

class PostCardViewModel: NSObject {

    
    private var  listPost: [Posts]
    
    // CONSTRUTOR INICIALIZANDO A LISTA
    init(listPost: [Posts]) {
        self.listPost = listPost
    }
    
    // Pegando a quantidade de itens na lista
    public var numberOfItems: Int {
        listPost.count
    }
    
    // passando indexPath que vai nos retornar um cara
    public func PostItems(indexPath: IndexPath) -> Posts {
        listPost[indexPath.row]
    }
}
