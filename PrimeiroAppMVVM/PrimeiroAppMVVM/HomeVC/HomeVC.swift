//
//  ViewController.swift
//  PrimeiroAppMVVM
//
//  Created by Jefferson Alves on 08/11/24.
//

import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    private var homeViewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configProtocolCollectionView(delegate: self, dataSource: self)
        
        // Essa barra se refere a NavigationBar que é exibida por padrão na NavigationController.
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }


}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return homeViewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            
            let cells = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.identifier, for: indexPath) as?  StoryCardCollectionViewCell
            cells?.setupCell(listStory: homeViewModel.getListStory)
            return cells ?? UICollectionViewCell()
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCardCollectionViewCell.identifier, for: indexPath) as? PostCardCollectionViewCell
            cell?.setupCell(listPosts: homeViewModel.getListPost)
            return cell ?? UICollectionViewCell()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        homeViewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
    }

}
