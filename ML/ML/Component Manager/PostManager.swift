//
//  PostManager.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation
import UIKit
import Alamofire


enum LikeDislikeEnum {
    case Li
}


class PostManager {
    
    static let sharedInstance = PostManager()
    
    var userPosts: Array<ItemModel> = [] {
        didSet {
            updateUserPosts?()
        }
    }
    
    var savedPosts: Array<ItemModel> = [] {
        didSet {
            updateSavedPosts?()
        }
    }
    
    
    
    
    func fetchAllSavedPosts() {
        
        guard let userID = UserDefaults.standard.string(forKey: "userID")  else {
            return
        }
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_Monolith, body: ["requestType": "fetchAllSavedPosts", "userID": userID]) { data in
            guard let data = data else {
                return
            }

            
            if let decodedResponse = try? JSONDecoder().decode(FetchAllUserPostsResponse.self, from: data) {
                self.savedPosts = decodedResponse.body.userPosts
            }
            
        }
        
        
    }
    
    func savePost(postID: String) {
        
        guard let userID = UserDefaults.standard.string(forKey: "userID")  else {
            return
        }
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_Monolith, body: ["requestType": "savePost","userID":userID,"postID": postID]) { _ in }
        
    }
    
    func likeOrDisLikePost(postID: String,type: String) {
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_Monolith, body: ["requestType": "likeOrDisLikePost","type": type,"postID": postID]) { data in
            guard let data = data else {
                return
            }
            
            if let _ = try? JSONDecoder().decode(DefualtServerResponse.self, from: data){
                self.FetchAllUserPosts()
                self.fetchAllSavedPosts()
                CategoryManger.sharedInstance.fetchPostsForCategory()
            }
            
        }
    }
    
    
    func FetchAllUserPosts() {
        
        guard let userID = UserDefaults.standard.string(forKey: "userID")  else {
            return
        }
        
        print("userID: \(userID)")
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_Monolith, body: ["requestType": "fetchAllUserPosts","userID": userID]) { data in
            
            guard let data = data else {
                return
            }

            if let decodedResponse = try? JSONDecoder().decode(FetchAllUserPostsResponse.self, from: data){
                self.userPosts = decodedResponse.body.userPosts
            }
            
        }
        
    }
    
    func fetchPostImagePresignedURL(imageKey: String,completion: @escaping (FetchImageForPostResponse) -> Void) {
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_Monolith, body: ["requestType": "fetchPostImagePresignedURL","imageKey": imageKey]) { data in
            
            guard let data = data else {
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(FetchImageForPostResponse.self, from: data) {
                completion(decodedResponse)
            }
            
            
        }
        
        
    }
    
    func fetchS3PresignedURL(completion: @escaping (FetchS3PresignedURLResponse) -> Void) {
        
        guard let userID = UserDefaults.standard.string(forKey: "userID")  else {
            return
        }
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_Monolith, body: ["requestType": "fetchS3PresignedURL","userID": userID]) { data in
            guard let data = data else {
                return
            }

            if let decodecResponse = try? JSONDecoder().decode(FetchS3PresignedURLResponse.self, from: data) {
                completion(decodecResponse)
            }
        }
        
    }
    
    
    func createPost(_ itemModel: ItemModel,postID: String,completion: @escaping (Bool) -> Void) {
        
        guard let userID: String = UserDefaults.standard.string(forKey: "userID")
        else {
            completion(false)
            return
        }
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_Monolith, body: ["requestType": "createPost","userID": userID, "title": itemModel.title,"postID": postID, "description": itemModel.description, "category": itemModel.categoryName,"imageKey": itemModel.imageKey]) { data in
            guard let data = data else {
                completion(false)
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(DefualtServerResponse.self, from: data) {
                if decodedResponse.statusCode == 200 {
                    self.FetchAllUserPosts()
                    completion(true)
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: .createPostCancelButtonPressed, object: nil)
                    }
                    return
                }
            }
            

        }
        
    }
    
    
    func uploadImageToS3UserFolder(image: UIImage, presignedURLData: FetchS3PresignedURLResponse,completion: @escaping (Bool) -> Void) {
        
        guard
//            let userID: String = UserDefaults.standard.string(forKey: "userID"),
            let imageData: Data = image.pngData(),
            let s3UploadPresignedURL = URL(string: presignedURLData.body.presigned_url.url)

        else {
            completion(false)
            return
        }
        
        
        let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("itemFile")
        print("fileURL: \(fileURL)")
        print("path: \(fileURL.path)")
        
       do {
           try imageData.write(to: fileURL)
       }
       catch {
           print("Error writing data to file \(error) and \(error.localizedDescription)")
           completion(false)
       }
        
        var request = URLRequest(url: s3UploadPresignedURL)
        request.httpMethod = "POST"
        
        AF.upload(multipartFormData: { multiPart in
            for (key, value) in presignedURLData.body.presigned_url.fields {
                    multiPart.append(value.data(using: .utf8)!, withName: key)
            }
            multiPart.append(fileURL, withName: "file", fileName: "file.png", mimeType: "image/png")
        }, with: request)
            .responseString(completionHandler: { serverResponse in
                print("Server Response is: \(serverResponse.debugDescription)")
                if serverResponse.response == nil {
                        completion(false)
                }
                else {
                    if serverResponse.response!.statusCode == 204 {
                            completion(true)
                    }
                    else {
                            completion(false)
                    }
                }
            })
        
    }

    
    var updateUserPosts: (() -> Void)?
    var updateSavedPosts: (() -> Void)?

}
