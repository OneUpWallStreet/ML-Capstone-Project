//
//  ItemModel.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation


struct ItemModel: Codable, Hashable {
    var title: String
    var postID: String
    var description: String
    var categoryName: String
    var imageKey: String
    var likes: Int
    var dislikes: Int
}

//"imageKey": "DASDUHUH342FJSDF-DASASFSF-3534/5EJVI5SEX31AM7RHY69AHELSTF5B6IZERWN410YW19HRQ3LJ53.png",
//"categoryName": "Electronics",
//"likes": 0,
//"dislikes": 0,
//"postID": "5EJVI5SEX31AM7RHY69AHELSTF5B6IZERWN410YW19HRQ3LJ53",
//"description": "Apple watch series 7. Hello world",
//"title": "Apple Watch Series 7"
