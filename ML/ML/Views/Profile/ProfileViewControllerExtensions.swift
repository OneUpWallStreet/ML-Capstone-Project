//
//  ProfileViewControllerExtensions.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation
import UIKit

protocol ProfileViewControllerDelegate {
    func deleteAccountFromServer()
    func logout()
}

extension ProfileViewController: ProfileViewControllerDelegate {
    
    
    func logout() {
        UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
        }
    }
    
    
    func deleteAccountFromServer() {
        
        print("Should Delete Account From Server")
        
        AuthenticationManager.sharedInstance.DeleteAccountFromServer { isAccountDeleted in
            if isAccountDeleted {
                UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
                }
            }
            else {
                let alert = UIAlertController(title: "Deleton Failed", message: "Something went wrong. Please check your network connection and try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
}

