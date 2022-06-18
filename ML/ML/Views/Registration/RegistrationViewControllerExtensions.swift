//
//  RegistrationViewControllerExtensions.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation

protocol RegistrationViewControllerDelegate {
    func loginWithEmail()
}


extension RegistrationViewController: RegistrationViewControllerDelegate {
    
    func loginWithEmail() {

        AuthenticationManager.sharedInstance.InitialUserRegistration(user: UserRegistrationModel(email: "larrypage@google.com", fullName: "Larry Page", uniqueID: "DASDUHUH342FJSDF-DASASFSF-3534")) { isRegistrationSuccesful in
            if isRegistrationSuccesful {
                UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                UserDefaults.standard.setValue("larrypage@google.com", forKey: "email")
                UserDefaults.standard.setValue("Larry", forKey: "firstName")
                UserDefaults.standard.setValue("Page", forKey: "lastName")
                UserDefaults.standard.setValue("DASDUHUH342FJSDF-DASASFSF-3534", forKey: "userID")
                UserDefaults.standard.setValue(0, forKey: "spamCounter")
                NotificationCenter.default.post(name: .userRegistrationWasSuccesful, object: nil)
            }
            else {
                NotificationCenter.default.post(name: .failedUserRegistration, object: nil)
            }
        }
        
    }
    
}
