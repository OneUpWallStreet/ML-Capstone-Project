//
//  CategorySwiftUIView.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import SwiftUI

struct CategorySwiftUIView: View {
    
    @ObservedObject var categoryVM = CategoryViewModel()
    
    var noPostsFound = LottieView(name: "noPosts", loopMode: .loop)
    var computerHub = LottieView(name: "hubComputer", loopMode: .loop)

    
    var body: some View {

        ScrollView(.vertical,showsIndicators: false){
            
            HeaderComponentSwiftUIView(title: CategoryManger.sharedInstance.currentCategory.rawValue, subTitle: "Safe & Moderated Content", imageName: "temp", lottieView: computerHub)
            
            if categoryVM.posts.count == 0 {
                Spacer()
                noPosts
                Spacer()
            }else{
                ForEach(categoryVM.posts,id: \.self){ post in
                    SinglePostSwiftUIView(item: post)
                }
            }
            
        }
        .padding(.horizontal)
        .onAppear {
            noPostsFound.animationView.play()
            CategoryManger.sharedInstance.fetchPostsForCategory()
        }
    }
    
    
    var noPosts: some View {
        
        VStack{
            noPostsFound
                .frame(width: 350, height: 350)

            Text("I'm Still Searching In The Cloud...")
                .multilineTextAlignment(.center)

            Spacer()
        }
        
    }
    
}

