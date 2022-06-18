//
//  RegistrationSwiftUIView.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import SwiftUI


import SwiftUI

struct RegistrationSwiftUIView: View {
    
    var delegate: RegistrationViewControllerDelegate?
    
    var body: some View {
        ZStack{
            
            backGroundImage
            
            VStack(alignment: .center){
                
                Spacer()
                
                Text("Registration")
                    .bold()
                    .font(.system(size: 60))
                    .foregroundColor(.white)

                Text("Connect")
                    .foregroundColor(.white)

                Spacer()
                
                Button {
                    delegate?.loginWithEmail()
                } label: {
                    Text("Login With Facebook")
                        .padding()
                        .background(Color .blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                
                SignInWithAppleSwiftUIView()
                
                Spacer()


                
                                
            }
        }

        
    }
    
    var backGroundImage: some View {
        Image("2")
            .resizable()
            .scaledToFill()
            .blur(radius: 0)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea(edges: .top)

    }
    
}
