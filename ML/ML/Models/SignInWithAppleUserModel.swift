//
//  SignInWithAppleUserModel.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation

import AuthenticationServices

struct SignInWithAppleUserModel {
    let userID: String
    let firstName: String
    let lastName: String
    let email: String
    
    
    init?(credentials: ASAuthorizationAppleIDCredential){
        
        guard let firstName = credentials.fullName?.givenName,
              let lastName = credentials.fullName?.familyName,
              let email = credentials.email
        else{ return nil }
        
        self.userID = credentials.user
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        
    }
    
}
