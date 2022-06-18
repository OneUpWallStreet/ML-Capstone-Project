//
//  MainTabBarViewController.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import UIKit


class MainTabBarViewController: UITabBarController {
    
    let HomeVC: UINavigationController = UINavigationController(rootViewController: HomeViewController())
    let MarketVC: UINavigationController = UINavigationController(rootViewController: PostsViewController())
    let ProfileVC: UINavigationController = UINavigationController(rootViewController: ProfileViewController())
    let SavedVC: UINavigationController = UINavigationController(rootViewController: SavedViewController())
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        
        HomeVC.title = "Home"
        MarketVC.title = "Messages"
        ProfileVC.title = "Profile"
        SavedVC.title = "Saved"
        
        super.viewDidLoad()

        self.setViewControllers([HomeVC,MarketVC,SavedVC,ProfileVC], animated: false)
        
        
        //iOS 15 tab bar is bugged, the background color is missing, this is a fix  found at "https://stackoverflow.com/questions/68688270/ios-15-uitabbarcontrollers-tabbar-background-color-turns-black"
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
        
        guard let items = self.tabBar.items else { return }
        let imageName: Array<String> = ["house","newspaper","bookmark.circle","person.crop.circle"]

        for (index,item) in items.enumerated() {
            item.image = UIImage(systemName: imageName[index])
        }
 
        
    }
    
}
