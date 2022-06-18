//
//  AuthenticationManager.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation


class AuthenticationManager {
    
    static let sharedInstance = AuthenticationManager()
    
    
//    {
//        "requestType": "initialUserRegistration",
//        "fullName": "Swarom Muley",
//        "email": "muleyswarom@gmail.com",
//        "uniqueID": "3424DSADSAD8DA9A7SDA9"
//    }
    
    func DeleteAccountFromServer(completion: @escaping (Bool) -> Void) {
        
        guard let userID = UserDefaults.standard.value(forKey: "userID") as? String else {
            completion(false)
            return
        }
        
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_Monolith, body: ["requestType": "deleteAccountFromServer", "userID": userID]) { data in
            guard let data = data else {
                return
            }

            if let decodedResponse = try? JSONDecoder().decode(DefualtServerResponse.self, from: data) {
                if decodedResponse.statusCode == 200 {
                    completion(true)
                    return
                }
            }
            
        }
        
    }
    
    func InitialUserRegistration(user: UserRegistrationModel, completion: @escaping (Bool) -> Void) {
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_Monolith, body: ["requestType": "initialUserRegistration", "fullName": user.fullName, "email": user.email, "uniqueID": user.uniqueID]) { data in
            
            
            guard let data = data else {
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(DefualtServerResponse.self, from: data) {
                if decodedResponse.statusCode == 200 {
                    completion(true)
                }
            }
            
        }
        
    }
    
}
