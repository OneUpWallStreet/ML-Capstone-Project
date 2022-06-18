//
//  PostsViewController.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import SwiftUI
import UIKit

class PostsViewController: UIViewController {
    
    
    
    let postsSwiftUIView = UIHostingController(rootView: PostsSwiftUIView())

    
    
    private func configureMarketSwiftUIView() {
        
        addChild(postsSwiftUIView)
        
        postsSwiftUIView.rootView.delegate = self
        
        postsSwiftUIView.view.frame = view.frame
        postsSwiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postsSwiftUIView.view)
        
        NSLayoutConstraint.activate([
            postsSwiftUIView.view.topAnchor.constraint(equalTo: view.topAnchor),
            postsSwiftUIView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postsSwiftUIView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsSwiftUIView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }

    
    @objc func handleMarketAddItemCancelButtonPressed() {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMarketSwiftUIView()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(handleMarketAddItemCancelButtonPressed), name: .marketAddItemCancelButtonPressed, object: nil)

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
