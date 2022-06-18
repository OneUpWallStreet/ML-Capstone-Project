//
//  BooksViewController.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import UIKit
import SwiftUI

class BooksViewController: UIViewController {

    let booksSwiftUIView = UIHostingController(rootView: BooksSwiftUIView())
    
    
    private func configureHomeSwiftUIView() {
        addChild(booksSwiftUIView)
        
        booksSwiftUIView.view.frame = view.frame
        booksSwiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(booksSwiftUIView.view)
        
        NSLayoutConstraint.activate([
            booksSwiftUIView.view.topAnchor.constraint(equalTo: view.topAnchor),
            booksSwiftUIView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            booksSwiftUIView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            booksSwiftUIView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        navigationController?.isNavigationBarHidden = true
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
