//
//  SinglePostSwiftUIView.swift
//  ML
//
//  Created by Arteezy on 6/17/22.
//

import SwiftUI

struct SinglePostSwiftUIView: View {
    
    var item: ItemModel
    @ObservedObject var singlePostVM = SinglePostViewModel()
    @State var boughtAlert: Bool = false
     
     
     init(item: ItemModel) {
         self.item = item
         singlePostVM.fetchImageForQuestion(item: item)
     }
     
     var body: some View {
         singleCategoryItem(item: item)

     }
    
    
    
     
     @ViewBuilder
     private func singleCategoryItem(item: ItemModel) -> some View {
         ZStack{
               
               RoundedRectangle(cornerRadius: 10)
                 .fill(Color.lightGray)
               
               VStack(alignment: .leading){
                   
                   HStack{
                       Text(item.title)
                           .font(.title3)
                           .foregroundColor(.black)
                           .bold()
                       
                       Spacer()
                       
                       Button {
                           PostManager.sharedInstance.savePost(postID: item.postID)
                       } label: {
                           Image("bookmark")
                               .resizable()
                               .frame(width: 30, height: 30, alignment: .center)
                       }

                   }
                   .padding(.horizontal)
                   
                   HStack{
                       Spacer()
                       Image(uiImage: singlePostVM.questionImage)
                           .resizable()
                           .frame(width: UIScreen.main.bounds.width-40,height: 200)
                           .cornerRadius(5)
                           .overlay(RoundedRectangle(cornerRadius: 5)
                               .stroke(Color.white, lineWidth: 4))
                           .shadow(radius: 5)
                       Spacer()
                   }
                   
                   
                   VStack(alignment: .leading){
                       Text(item.description)
                           .padding(.vertical)
                       
                   
                       buttons
                   }
                   .padding(.horizontal)

               }
               .padding()
               .foregroundColor(.black)
           
           }
           .frame(width: UIScreen.main.bounds.width-20)
           .padding(.vertical)
     
     }
     
     
     var buttons: some View {
         
         HStack{
                                 
             Spacer()
             
             Button {
                 PostManager.sharedInstance.likeOrDisLikePost(postID: item.postID, type: "LIKE")
             } label: {
                 ZStack{
                     VStack{
                         RoundedRectangle(cornerRadius  : 5, style: .continuous)
                             .fill(.red)
                             .frame(width: 150, height: 45, alignment: .center)
                     }
                     HStack{
                         Image("like")
                             .resizable()
                             .frame(width: 32.5, height: 32.5, alignment: .center)
                         Text("\(item.likes)")
                             .foregroundColor(.white)
                             .bold()
                     }
                 }
                 .alert(isPresented: $boughtAlert) {
                     Alert(title: Text("Bought Item"), message: Text("Transaction was succesful. Please check the log"), dismissButton: .default(Text("Got it!")))
                 }

             }

             
             Spacer()
             
             Button {
                 PostManager.sharedInstance.likeOrDisLikePost(postID: item.postID, type: "DISLIKE")
             } label: {
                 ZStack{
                     VStack{
                         RoundedRectangle(cornerRadius  : 5, style: .continuous)
                             .fill(.red)
                             .frame(width: 150, height: 45, alignment: .center)
                     }
                     HStack{
                         Image("dislike")
                             .resizable()
                             .frame(width: 32.5, height: 32.5, alignment: .center)
                         Text("\(item.dislikes)")
                             .foregroundColor(.white)
                             .bold()
                     }
                 }
                 .alert(isPresented: $boughtAlert) {
                     Alert(title: Text("Bought Item"), message: Text("Transaction was succesful. Please check the log"), dismissButton: .default(Text("Got it!")))
                 }

             }
             
             Spacer()
             
             
             
             

         }
         

         
     }
     
    
}

