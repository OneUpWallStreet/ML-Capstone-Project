//
//  SavedViewModel.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import Foundation
import UIKit


class SavedViewModel: ObservableObject {
    
    @Published var savedPosts: Array<ItemModel> = []
        
    func updateSavedPostsInUI() {
        DispatchQueue.main.async {
            self.savedPosts = PostManager.sharedInstance.savedPosts
        }
    }
    
    init() {
        PostManager.sharedInstance.updateSavedPosts = updateSavedPostsInUI
    }
    
    
}
