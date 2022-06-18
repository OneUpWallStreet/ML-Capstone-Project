//
//  BooksSwiftUIView.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import SwiftUI

struct BooksSwiftUIView: View {
    
    var noPostsFound = LottieView(name: "noPosts", loopMode: .loop)
    
    var body: some View {
        
  
        ScrollView(.vertical,showsIndicators: false){
            
            HeaderComponentSwiftUIView(title: "Books", subTitle: "Today's Top Posts", imageName: "social-media")
                              
                noPosts
                
                Spacer()
                            

            
        }
        .padding(.horizontal)
        .onAppear {
            noPostsFound.animationView.play()
        }
    }
    
    var noPosts: some View {
        
        VStack{
            noPostsFound
                .frame(width: 275, height: 275)

            Text("Looks Like We Can't Find Any Posts For This Category")
                .multilineTextAlignment(.center)

            Spacer()
        }
        
    }
    
}

