//
//  PostsViewModel.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import Foundation


class PostsViewModel: ObservableObject {
    
    @Published var userPosts: Array<ItemModel> = []
    
    func updateUserPosts() {
        DispatchQueue.main.async {
            self.userPosts = PostManager.sharedInstance.userPosts
        }
    }
    
    init() {
        PostManager.sharedInstance.updateUserPosts = updateUserPosts
    }
    
    
}
