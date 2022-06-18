//
//  InitialUserRegistrationResponse.swift
//  MarketPlace
//
//  Created by Arteezy on 4/7/22.
//

import Foundation



//{
//    "statusCode": 200,
//    "body": {
//        "message": "User Registered"
//    }
//}

struct DefualtServerResponse: Codable {
    
    var statusCode: Int
    var body: RequestBody
    
    struct RequestBody: Codable {
        var message: String
    }
    
    
}
