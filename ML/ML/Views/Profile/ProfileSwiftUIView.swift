//
//  ProfileSwiftUIView.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import SwiftUI

struct ProfileSwiftUIView: View {
    
    var delegate: ProfileViewControllerDelegate?
    
    @State var firstName: String = UserDefaults.standard.string(forKey: "firstName")!
    var robot = LottieView(name: "robot3",loopMode: .loop)
    var lock = LottieView(name: "lock", loopMode: .playOnce)
    
    var body: some View {
        VStack{
            
            HStack{
                
                VStack(alignment: .leading){
                    Text(firstName)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .bold()
                    Text("Welcome Back")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                robot
                    .frame(width: 100, height: 100, alignment: .center)

            }
            
            lock
                .frame(width: 400, height: 400, alignment: .center)
            
            Spacer()
            
            Button {
                delegate?.logout()
            } label: {
                logout
            }

            
            Button {
                delegate?.deleteAccountFromServer()
            } label: {
                deleteAccount
            }

            
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            robot.animationView.play()
        }
    }
    
    var deleteAccount: some View {
        
        ZStack{
              RoundedRectangle(cornerRadius: 10)
                .fill(Color.carrotRedBackground)

              HStack{
                  Text("Delete Account From Server")
                      .foregroundColor(Color.carrotRedText)
                  Spacer()
              }
              .padding(.horizontal)

          }
          .frame(width: UIScreen.main.bounds.width - 30, height: 45, alignment: .center)
    }
    
    var logout: some View {
        
        ZStack{
              RoundedRectangle(cornerRadius: 10)
                .fill(Color.carrotRedBackground)

              HStack{
                  Text("Logout From Current Session")
                      .foregroundColor(Color.carrotRedText)
                  Spacer()
              }
              .padding(.horizontal)

          }
          .frame(width: UIScreen.main.bounds.width - 30, height: 45, alignment: .center)
    }

    
    
    var purchaseHistory: some View {
        
        VStack(alignment: .leading){
            HStack{
                Text("Posts")
                    .font(.title3)
                    .bold()
                    
                Spacer()
                
            }

            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.lightGray)

                HStack{
                    Spacer()
                    Text("+")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal)
                
            }
            .frame(width: 150, height: 200, alignment: .center)
            
        }

        
        .padding(.vertical)
        
    }
}


