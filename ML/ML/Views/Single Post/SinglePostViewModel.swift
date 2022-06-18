//
//  SinglePostViewModel.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import Foundation
import UIKit

class SinglePostViewModel: ObservableObject {
    
    @Published var questionImage: UIImage = UIImage(named: "placeholderImage")!
    
    func fetchImageForQuestion(item: ItemModel) {
        
        PostManager.sharedInstance.fetchPostImagePresignedURL(imageKey: item.imageKey) { preSignedURL in
            
            let s3URL = URL(string: preSignedURL.body.presigned_url)
            
            guard let data  = try? Data(contentsOf: s3URL!) else {
                return
            }
            
            guard let imageFetchedFromServer = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.questionImage = imageFetchedFromServer
            }
        }
    
    }
    
    
    
}
