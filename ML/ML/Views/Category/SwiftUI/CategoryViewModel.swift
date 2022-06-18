//
//  File.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import Foundation


class CategoryViewModel: ObservableObject {
    
    @Published var posts: Array<ItemModel> = []
        
    
    private func updateCategoryPosts() {
        DispatchQueue.main.async {
            self.posts = CategoryManger.sharedInstance.categoryItems
        }
    }
    
    init() {
        CategoryManger.sharedInstance.updateCategoryItems = updateCategoryPosts
        
    }
    
}
