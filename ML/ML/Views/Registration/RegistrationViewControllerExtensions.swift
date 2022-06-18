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

        AuthenticationManager.sharedInstance.InitialUserRegistration(user: UserRegistrationModel(email: "muleyswarom@gmail.com", fullName: "Swarom Muley", uniqueID: "YASZUVUGT42FJSDF-MASATFSF-3534")) { isRegistrationSuccesful in
            if isRegistrationSuccesful {
                UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                UserDefaults.standard.setValue("muleyswarom@gmail.com", forKey: "email")
                UserDefaults.standard.setValue("Swarom", forKey: "firstName")
                UserDefaults.standard.setValue("Muley", forKey: "lastName")
                UserDefaults.standard.setValue("YASZUVUGT42FJSDF-MASATFSF-3534", forKey: "userID")
                UserDefaults.standard.setValue(0, forKey: "spamCounter")
                NotificationCenter.default.post(name: .userRegistrationWasSuccesful, object: nil)
            }
            else {
                NotificationCenter.default.post(name: .failedUserRegistration, object: nil)
            }
        }
        
    }
    
}
