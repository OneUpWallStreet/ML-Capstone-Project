//
//  SignInWithAppleSwiftUIView.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//


import SwiftUI
import AuthenticationServices

struct SignInWithAppleSwiftUIView: View {
    var body: some View {
        SignInWithAppleButton(.signUp, onRequest: configure, onCompletion: handle)
            .signInWithAppleButtonStyle(.black)
            .frame(width: 200, height: 60, alignment: .center)
    }
    
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.email,.fullName]
        
        
    }
    
    func handle( _ authResult: Result<ASAuthorization,Error>){
        switch authResult {
            case .success(let auth):
                switch auth.credential {
                    case let appleIDCredentials as ASAuthorizationAppleIDCredential:
                        if let appleUser = SignInWithAppleUserModel(credentials: appleIDCredentials) {
                            UserDefaults.standard.setValue(appleUser.email, forKey: "email")
                            UserDefaults.standard.setValue(appleUser.firstName, forKey: "firstName")
                            UserDefaults.standard.setValue(appleUser.lastName, forKey: "lastName")
                            UserDefaults.standard.setValue(appleUser.userID, forKey: "userID")
                            
                            let fullName = appleUser.firstName + " " + appleUser.lastName
                            
                            AuthenticationManager.sharedInstance.InitialUserRegistration(user: UserRegistrationModel(email: appleUser.email, fullName: fullName, uniqueID: appleUser.userID)) { isUserRegistered in
                                
                                if isUserRegistered {
                                    UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                                    UserDefaults.standard.setValue(appleUser.email, forKey: "email")
                                    UserDefaults.standard.setValue(appleUser.firstName, forKey: "firstName")
                                    UserDefaults.standard.setValue(appleUser.lastName, forKey: "lastName")
                                    UserDefaults.standard.setValue(appleUser.userID, forKey: "userID")
                                    UserDefaults.standard.setValue(0, forKey: "spamCounter")
                                    NotificationCenter.default.post(name: .userRegistrationWasSuccesful, object: nil)
                                    return
                                }
                                else {
                                    NotificationCenter.default.post(name: .failedUserRegistration, object: nil)
                                }
                                
                                
                            }
                            
//                            print("Looks Like \(appleUser.firstName) \(appleUser.lastName) is signed in with email \(appleUser.email) and user Id \(appleUser.userID)")
                        }
                default:
                    print("uth")
                }
            case .failure(let error):
                print("error: \(error)")
            }
    }
}
