//
//  CategoryManager.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import Foundation

class CategoryManger {
    
    
    static var sharedInstance = CategoryManger()
    
    var categoryItems: Array<ItemModel> = [] {
        didSet {
            updateCategoryItems?()
        }
    }
    
    
    var currentCategory: CategoryEnum = .Books
    
    
    func fetchPostsForCategory() {
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_Monolith, body: ["requestType": "fetchPostsForCategory","category": currentCategory.rawValue]) { data in
            
            guard let data = data else {
                return
            }

            if let decodedResponse = try? JSONDecoder().decode(FetchAllUserPostsResponse.self,from: data) {
                self.categoryItems = decodedResponse.body.userPosts
            }
            
        }
    }
    
    
    var updateCategoryItems: (() -> Void)?

    
    
}
