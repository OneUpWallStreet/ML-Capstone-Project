//
//  HomeViewController.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import UIKit
import SwiftUI


protocol HomeViewControllerDelegate {
    func categoryButtonPressed(_ category: CategoryEnum)
}



class HomeViewController: UIViewController {
    
    let homeSwiftUIView = UIHostingController(rootView: HomeSwiftUIView())
    
    
    private func configureHomeSwiftUIView() {
        addChild(homeSwiftUIView)
        
        homeSwiftUIView.rootView.delegate = self
        
        homeSwiftUIView.view.frame = view.frame
        homeSwiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeSwiftUIView.view)
        
        NSLayoutConstraint.activate([
            homeSwiftUIView.view.topAnchor.constraint(equalTo: view.topAnchor),
            homeSwiftUIView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeSwiftUIView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeSwiftUIView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHomeSwiftUIView()

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
