//
//  HomeViewControllerExtensions.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation
import UIKit


extension HomeViewController: HomeViewControllerDelegate {
    
    
    
    func categoryButtonPressed(_ category: CategoryEnum) {
        CategoryManger.sharedInstance.currentCategory = category
        self.navigationController?.pushViewController(CategoryViewController(), animated: true)
    }
    
    
}
