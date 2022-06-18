//
//  FetchItemImagePresignedURLResponse.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation


import Foundation

struct FetchS3PresignedURLResponse: Codable {
    
    
    
    var statusCode: Int
    var body: RequestBody
    
    struct RequestBody: Codable {
        var nameOfObject: String
        var keyName: String
        var presigned_url: PresignedURLBody
    
        struct PresignedURLBody: Codable {
            var url: String
            var fields: [String: String]
        }
    }
    
    
    
    
}
