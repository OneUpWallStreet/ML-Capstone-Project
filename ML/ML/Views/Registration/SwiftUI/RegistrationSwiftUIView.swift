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
                    HStack{
                        Image("gmail")
                            .resizable()
                            .frame(width: 17.5, height: 17.5, alignment: .center)
                        Text("Login With Email")
                            .bold()
                    }
                    .frame(width: 200, height: 60, alignment: .center)
//                    .padding()
                    .background(Color .white)
                    .foregroundColor(.black)
                    .cornerRadius(5)
                }
                
                SignInWithAppleSwiftUIView()
                
                Spacer()


                
                                
            }
        }

        
    }
    
    var backGroundImage: some View {
        Image("back2")
            .resizable()
            .scaledToFill()
            .blur(radius: 0)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea(edges: .top)

    }
    
}
