//
//  StoryCardViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 16/11/24.
//

import UIKit

class StoryCardViewModel {

    private var listStory:[Stories]
    
    // Inicializando e recebendo a lista
    init(listStory:[Stories]){
        self.listStory = listStory
    }
    
    // pega a quantidade de items do objeto
    public var numberOfItems: Int {
        listStory.count
    }
    
    // passando indexPath que vai nos retornar um cara
    func loudCurrentStory(indexPath: IndexPath) -> Stories {
        listStory[indexPath.row]
    }
}
