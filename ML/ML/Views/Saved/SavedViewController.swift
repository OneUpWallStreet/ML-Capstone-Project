//
//  SavedViewController.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import UIKit
import SwiftUI


class SavedViewController: UIViewController {
    
    
    let savedSwiftUIView = UIHostingController(rootView: SavedSwiftUIView())

    
    private func configureSavedSwiftUIView() {
        
        addChild(savedSwiftUIView)
        
        savedSwiftUIView.view.frame = view.frame
        savedSwiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(savedSwiftUIView.view)
        
        NSLayoutConstraint.activate([
            savedSwiftUIView.view.topAnchor.constraint(equalTo: view.topAnchor),
            savedSwiftUIView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            savedSwiftUIView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            savedSwiftUIView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSavedSwiftUIView()

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
