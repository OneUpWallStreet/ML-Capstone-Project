//
//  HomeSwiftUIView.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import SwiftUI


struct HomeSwiftUIView: View {
    
    var delegate: HomeViewControllerDelegate?
    var socialImage = LottieView(name: "man", loopMode: .loop)
    var phone = LottieView(name: "phoneMedia", loopMode: .loop)
    var robot = LottieView(name: "robot1",loopMode: .loop)
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            HeaderComponentSwiftUIView(title: "Curated Content", subTitle: "ML Moderation", imageName: "gold",lottieView: robot)
            
            phone
                .frame(width: 325, height: 325, alignment: .center)

            
            HeaderComponentSwiftUIView(title: "Categories", subTitle: "Popular Items", imageName: "trending",lottieView: socialImage)


            singleCategory(categoryName: CategoryEnum.Books, imageName: "book")
            singleCategory(categoryName: CategoryEnum.Electronics, imageName: "gadgets")
            singleCategory(categoryName: CategoryEnum.Music, imageName: "music")
            singleCategory(categoryName: CategoryEnum.Movies, imageName: "movie")
            singleCategory(categoryName: CategoryEnum.Jewellery, imageName: "engagement-ring")
            singleCategory(categoryName: CategoryEnum.Entertainment, imageName: "popcorn")
            
            
            Spacer()
        
        }
        .padding(.horizontal)
        .onAppear {
            phone.animationView.play()
        }

    }
    
    
    var featuredItems: some View {
        
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 25){
                singleFeaturedItem(imageName: "photoTips", text: "Photography Tips")
                singleFeaturedItem(imageName: "travelTips", text: "Why Travel?")
                singleFeaturedItem(imageName: "rockMusic", text: "Who Loves Rock!!")
                
            }
        }
    }
    

    
    @ViewBuilder
    private func singleFeaturedItem(imageName: String, text: String) -> some View {
        
        VStack(alignment: .leading,spacing: 5){
            
            ZStack(alignment: .bottom){
                Image(imageName)
                    .resizable()
                    .frame(width: 250, height: 350, alignment: .center)
                HStack{
                    Spacer()
                    Text(text)
                    Spacer()
                }.frame(width: 250, height: 50, alignment: .center).background(Color .black).foregroundColor(.white)
                
            }.frame(width: 250, height: 350, alignment: .center)
            .cornerRadius(10)
        }
        
    }
    
    
    @ViewBuilder
    private func singleCategory(categoryName: CategoryEnum, imageName: String) -> some View {
        
        Button {
            
            delegate?.categoryButtonPressed(categoryName)
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.lightGray)

                HStack{
                    
                    Image(imageName)
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .center)
                        .padding(.trailing)
                    
                    
                    Text(categoryName.rawValue)
                        .bold()
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal)

            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 60, alignment: .center)
            .padding(.vertical,10)
            
        }


        
    }
    
    

}
