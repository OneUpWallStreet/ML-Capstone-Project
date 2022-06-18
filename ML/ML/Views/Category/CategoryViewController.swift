//
//  CategoryViewController.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import UIKit
import SwiftUI

class CategoryViewController: UIViewController {
    
    let categorySwiftUIView = UIHostingController(rootView: CategorySwiftUIView())

    private func configureCategorySwiftUIView() {
        addChild(categorySwiftUIView)
        
        categorySwiftUIView.view.frame = view.frame
        categorySwiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categorySwiftUIView.view)
        
        NSLayoutConstraint.activate([
            categorySwiftUIView.view.topAnchor.constraint(equalTo: view.topAnchor),
            categorySwiftUIView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categorySwiftUIView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categorySwiftUIView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCategorySwiftUIView()
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
