//
//  SavedSwiftUIView.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import SwiftUI

struct SavedSwiftUIView: View {
    
    var robot = LottieView(name: "9944-ai-robot",loopMode: .loop)
    var noPostsFound = LottieView(name: "noPosts", loopMode: .loop)

    
    @ObservedObject var savedVM = SavedViewModel()
    
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: false){
            
            HeaderComponentSwiftUIView(title: "Saved Posts", subTitle: "What You Bookmarked", imageName: "temp", lottieView: robot)
            
            
            if savedVM.savedPosts.count == 0 {
                noPosts
            }else{
                ForEach(savedVM.savedPosts,id: \.self) { post in
                    SinglePostSwiftUIView(item: post)
                }
            }
            
            Spacer()
            
        }
        .padding(.horizontal)
        .onAppear {
            noPostsFound.animationView.play()
            PostManager.sharedInstance.fetchAllSavedPosts()
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

