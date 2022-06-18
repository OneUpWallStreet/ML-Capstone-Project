//
//  HeaderComponentSwiftUIView.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//


import SwiftUI

struct HeaderComponentSwiftUIView: View {
    
    var title: String
    var subTitle: String
    var imageName: String
    var imageWidth: CGFloat = 60
    var imageHeight: CGFloat = 60
    var lottieView: LottieView?
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .bold()
                Text(subTitle)
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            if lottieView != nil {
                lottieView
                    .frame(width: imageWidth+15, height: imageHeight+15, alignment: .center)


            }
            else{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageWidth, height: imageHeight, alignment: .center)
                
            }
            


        }
        .onAppear {
            lottieView?.animationView.play()
//                        noPostsFound.animationView.play()

        }
    }

}
