//
//  AuthenticationViewController.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import UIKit
import UIKit
import SwiftUI



class RegistrationViewController: UIViewController {
    

    
    
    var registrationSwiftUIView = UIHostingController(rootView: RegistrationSwiftUIView())
    
    private func configureRegistrationSwiftUIView() {
        
        addChild(registrationSwiftUIView)
        
        registrationSwiftUIView.rootView.delegate = self
        
        registrationSwiftUIView.view.frame = view.frame
        registrationSwiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registrationSwiftUIView.view)
        
        NSLayoutConstraint.activate([
            registrationSwiftUIView.view.topAnchor.constraint(equalTo: view.topAnchor),
            registrationSwiftUIView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            registrationSwiftUIView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registrationSwiftUIView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }

//    static let userRegistrationWasSuccesful = Notification.Name("userRegistrationWasSuccesful")
//    static let failedUserRegistration = Notification.Name("userRegistrationWasUnSuccesful")
    
    @objc func handleUserRegistrationWasSuccesful() {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(MainTabBarViewController(), animated: true)
        }
    }
    
    @objc func handleFailedUserRegistration() {
        let alert = UIAlertController(title: "Registration Failed", message: "Something went wrong. Please check your network connection and try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alert, animated: true, completion: nil)
    }
    
    
//  Hide navigation controller from here to avoid the animation -> https://stackoverflow.com/a/47940946/14918173
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRegistrationSwiftUIView()
        self.tabBarController?.tabBar.isHidden = true

        NotificationCenter.default.addObserver(self, selector: #selector(handleUserRegistrationWasSuccesful), name: .userRegistrationWasSuccesful, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFailedUserRegistration), name: .failedUserRegistration, object: nil)
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
