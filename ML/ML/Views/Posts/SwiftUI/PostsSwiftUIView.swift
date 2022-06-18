//
//  PostsSwiftUIView.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import SwiftUI

struct PostsSwiftUIView: View {
    
    var delegate: PostsViewControllerDelegate?
    @ObservedObject var postsVM = PostsViewModel()
    
    var emptyBox = LottieView(name: "emptyBox", loopMode: .playOnce)
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            
            HeaderComponentSwiftUIView(title: "Your Posts", subTitle: "What's On Your Mind", imageName: "social-media")
              
            if postsVM.userPosts.count == 0 {
                noPosts
            }
            else{
                ForEach(postsVM.userPosts,id: \.self) { item in
                    SinglePostSwiftUIView(item: item)
                }
            }

            Spacer()
                            
            Button {
                delegate?.AddItemForSaleButtonPressed()
            } label: {
                newSaleButton
            }

            
        }
        .padding(.horizontal)
        .onAppear {
            emptyBox.animationView.play()
            PostManager.sharedInstance.FetchAllUserPosts()
        }
    }
    
    var noPosts: some View {
        
        VStack{
            emptyBox
                .frame(width: 275, height: 275)

            Text("Looks like you have no posts, create one to share your thoughts with the world!")
                .multilineTextAlignment(.center)

            Spacer()
        }
        
    }
    
    @ViewBuilder
    private func singleItem(_ item: ItemModel) -> some View{
        ZStack{
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color .lightGray)
            
            VStack(alignment: .leading){
                
                Image("placeholderImage")
                    .resizable()
                    .frame(width: 340, height: 200, alignment: .center)
                
                
                Text(item.title)
                    .font(.headline)
                    .bold()
                    .padding()
                
                Text(item.description)
                    .padding()


            }
            
        }
        .frame(width: 340, alignment: .center)
        .cornerRadius(10)
    }
    

    
    var newSaleButton: some View {
        
        ZStack{
              RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)

              HStack{
                  Spacer()
                  Text("Create New Post")
                      .bold()
                      .foregroundColor(Color.white)
                  Spacer()
              }
              .padding(.horizontal)

          }
          .frame(width: 275, height: 50, alignment: .center)
        
    }
    
    }

