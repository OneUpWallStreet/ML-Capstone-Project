//
//  CreatePostViewModel.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation


import UIKit


class CreatePostViewModel: ObservableObject {
    
    
    @Published var isImageSelected: Bool = false
    @Published var itemName: String = ""
    @Published var itemDescription: String = ""
    @Published var itemCategory: CategoryEnum?
    @Published var userSelectedImage: UIImage?
    @Published var showIncompleteFieldsForItemAlert: Bool = false
    @Published var failureToCreatePost: Bool = false
    @Published var postIsSpam: Bool = false
    
    
    @objc func createPostUserImageChanged(notification: NSNotification) {
        
        guard let selectedImage = notification.object as? UIImage else { return }
        DispatchQueue.main.async {
            self.isImageSelected = true
            self.userSelectedImage = selectedImage
        }
    }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(createPostUserImageChanged), name: .createPostUserImageChanged, object: nil)
    }
    
    
    struct CategoryUIData {
        var categoryTitle: String
        var categoryImageName: String
    }
    
    
    func setItemForSale() {

        if itemName == "" ||  itemDescription == "" || itemCategory == nil || isImageSelected == false {
            showIncompleteFieldsForItemAlert.toggle()
            return
        }

        guard let itemImage = userSelectedImage else {
            showIncompleteFieldsForItemAlert.toggle()
            return
        }
        
        
        MachineLearningManager.sharedInstance.runMachineLearningModelOnText(text: itemDescription) { safeOrSpam in
            if safeOrSpam == .safe {
                PostManager.sharedInstance.fetchS3PresignedURL { s3PresignedURLData in
                    
                    PostManager.sharedInstance.uploadImageToS3UserFolder(image: itemImage, presignedURLData: s3PresignedURLData) { [self] isUploadSuccesful in
                        
                        if isUploadSuccesful {
                            PostManager.sharedInstance.createPost(ItemModel(title: itemName, postID: "", description: itemDescription, categoryName: itemCategory!.rawValue, imageKey: s3PresignedURLData.body.keyName,likes: 0,dislikes: 0), postID: s3PresignedURLData.body.nameOfObject) { isPostCreationSuccesful in
                                if isPostCreationSuccesful {
                                   print("Post Created")
                                }
                                else{
                                    DispatchQueue.main.async {
                                        self.failureToCreatePost.toggle()
                                    }
                                }
                            }
                        }
                        
                    }
                    
                }
            }else{
                let counter = UserDefaults.standard.value(forKey: "spamCounter") as! Int + 1
                if counter == 10 {
                    AuthenticationManager.sharedInstance.DeleteAccountFromServer { _ in }
                }
                UserDefaults.standard.setValue(counter, forKey: "spamCounter")
                DispatchQueue.main.async {
                    self.postIsSpam.toggle()
                }


            }
        }
        
        

//
//
//        MarketManager.sharedInstance.fetchS3PresignedURL { s3PresignedURLData in
//            MarketManager.sharedInstance.uploadImageToS3UserFolder(image: itemImage, presignedURLData: s3PresignedURLData) { [self] isUploadSuccesful in
//                if isUploadSuccesful {
//                    let itemModel = ItemModel(title: self.itemName, description: self.itemDescription, price: self.itemPrice, category: self.itemCategory!.rawValue, imageKey: s3PresignedURLData.body.keyName)
//                    MarketManager.sharedInstance.setItemForSale(itemModel) { isItemUploadSuccesful in
//                        if isItemUploadSuccesful {
//                            CurrentSessionManager.sharedInstance.fetchAllItemsForSaleByUserResponse()
//                            NotificationCenter.default.post(name: .setItemForSaleWasSuccesful, object: nil)
//                        }
//                        else {
//                            failureToSetItemForSale.toggle()
//                        }
//                    }
//                }
//                else {
//                    failureToSetItemForSale.toggle()
//                }
//            }
//        }
    }
    
    
    func fetchCategoryUIData(_ category: CategoryEnum) -> CategoryUIData {
        
        switch category {
            case .Books:
                return CategoryUIData(categoryTitle: category.rawValue, categoryImageName: "book")
            case .Electronics:
                return CategoryUIData(categoryTitle: category.rawValue, categoryImageName: "gadgets")

            case .Music:
                return CategoryUIData(categoryTitle: category.rawValue, categoryImageName: "music")

            case .Movies:
                return CategoryUIData(categoryTitle: category.rawValue, categoryImageName: "movie")

            case .Jewellery:
                return CategoryUIData(categoryTitle: category.rawValue, categoryImageName: "engagement-ring")

            case .Entertainment:
                return CategoryUIData(categoryTitle: category.rawValue, categoryImageName: "popcorn")

        }
        
    }
    
    
}
