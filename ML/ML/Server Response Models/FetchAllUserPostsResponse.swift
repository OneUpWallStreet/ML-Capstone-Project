//
//  FetchAllUserPostsResponse.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import Foundation


struct FetchAllUserPostsResponse: Codable {
    
    var statusCode: Int
    var body: RequestBody
    
    struct RequestBody: Codable {
        var userPosts: Array<ItemModel>
    }
    
}
