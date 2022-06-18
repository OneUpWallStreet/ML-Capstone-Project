//
//  PostsViewControllerExtensions.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation



import Foundation

protocol PostsViewControllerDelegate {
    func AddItemForSaleButtonPressed()
}

extension PostsViewController: PostsViewControllerDelegate {
    
    func AddItemForSaleButtonPressed() {
        present(CreatePostViewController(), animated: true)
    }
    
    
    
}
