//
//  ProfileViewController.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import UIKit
import SwiftUI

class ProfileViewController: UIViewController {

    let profileSwiftUIView = UIHostingController(rootView: ProfileSwiftUIView())

    private func configureProfileSwiftUIView() {
        
        addChild(profileSwiftUIView)
        
        profileSwiftUIView.rootView.delegate = self
        
        profileSwiftUIView.view.frame = view.frame
        profileSwiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileSwiftUIView.view)
        
        NSLayoutConstraint.activate([
            profileSwiftUIView.view.topAnchor.constraint(equalTo: view.topAnchor),
            profileSwiftUIView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            profileSwiftUIView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileSwiftUIView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureProfileSwiftUIView()

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
