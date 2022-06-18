//
//  CreatePostViewController.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//


import UIKit
import SwiftUI

class CreatePostViewController: UIViewController {
    
    
    var createPostSwiftUIVIew = UIHostingController(rootView: CreatePostSwiftUIView())

    
    private func configureMarketAddItemSwiftUIView() {
        
        addChild(createPostSwiftUIVIew)
        
        createPostSwiftUIVIew.rootView.delegate = self
        
        createPostSwiftUIVIew.view.frame = view.frame
        createPostSwiftUIVIew.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createPostSwiftUIVIew.view)
        
        NSLayoutConstraint.activate([
            createPostSwiftUIVIew.view.topAnchor.constraint(equalTo: view.topAnchor),
            createPostSwiftUIVIew.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            createPostSwiftUIVIew.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            createPostSwiftUIVIew.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    @objc func handleSetItemForSaleWasSuccesful() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSetItemForSaleWasSuccesful), name: .createPostCancelButtonPressed, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(handleSetItemForSaleWasSuccesful), name: .setItemForSaleWasSuccesful, object: nil)
        
        configureMarketAddItemSwiftUIView()
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

