//
//  FetchImageForQuestionResponse.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import Foundation


struct FetchImageForPostResponse: Codable {
    
    var statusCode: Int
    var body: RequestBody
    
    struct RequestBody: Codable {
        var presigned_url: String
    }
    
}
