//
//  CreatePostSwiftUIView.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import SwiftUI

import SwiftUI



struct CreatePostSwiftUIView: View {
    

    
//    var delegate: MarketAddItemViewControllerDelegate?
    var delegate: CreatePostViewControllerDelegate?
    
    @ObservedObject var markAddItemVM = CreatePostViewModel()
    
    var body: some View {
        VStack{
            
            HStack{
                Button {
                    delegate?.cancelButtonPressed()
                } label: {
                    Text("Cancel")
                }
                Spacer()
            }
            .padding()
            titleInput
            discription
//                .alert(isPresented: $markAddItemVM.postIsSpam) {
//                      Alert(title: Text("Post Is Spam"), message: Text("10 strikes will lead to deactivation of your account. Please post according to the rules!"), dismissButton: .default(Text("Okay")))
//                  }
            category
            Button {
                markAddItemVM.setItemForSale()
            } label: {
                submiButton
                .alert(isPresented: $markAddItemVM.showIncompleteFieldsForItemAlert) {
                      Alert(title: Text("Please Enter All Values"), message: Text("In order to create post you need to enter all values. Please do so and try again!"), dismissButton: .default(Text("Sounds Good")))
                  }
            }

            
            Spacer()
            
        }
        .alert(isPresented: $markAddItemVM.postIsSpam) {
              Alert(title: Text("Post Is Spam"), message: Text("10 strikes will lead to deactivation of your account. Please post according to the rules!"), dismissButton: .default(Text("Okay")))
          }

    }
    
    
    
    private func fetchCategoryColor(_ itemUIData: CreatePostViewModel.CategoryUIData) -> CategoryColors  {

        guard let itemCategory = markAddItemVM.itemCategory else {
            return CategoryColors(backGroundColor: .lightGray, foreGroundColor: .gray)
        }
        
        if itemCategory.rawValue == itemUIData.categoryTitle {
            return CategoryColors(backGroundColor: .pink, foreGroundColor: .white)
        }
        
        return CategoryColors(backGroundColor: .lightGray, foreGroundColor: .gray)

    }
    
    private struct CategoryColors {
        var backGroundColor: Color
        var foreGroundColor: Color
    }
    
    @ViewBuilder
    private func singleCategory(_ itemUIData: CreatePostViewModel.CategoryUIData) -> some View{
        
        ZStack{
            
            let categoryColors = fetchCategoryColor(itemUIData)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(categoryColors.backGroundColor)

            HStack{
                Image(itemUIData.categoryImageName)
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding(.trailing)
                
                Text(itemUIData.categoryTitle)
                    .bold()
                    .foregroundColor(categoryColors.foreGroundColor)
                Spacer()
            }
            .padding(.horizontal)

        }
        .frame(width: 200, height: 40, alignment: .center)
        
    }
    
    
    
    var category: some View {
        
        VStack(alignment: .leading) {
            Text("Cateogory")
                .bold()

            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<CategoryEnum.allCases.count) { index in
                        let itemUIData = markAddItemVM.fetchCategoryUIData(CategoryEnum.allCases[index])
                        Button {
                            markAddItemVM.itemCategory = CategoryEnum.allCases[index]
                        } label: {
                            singleCategory(itemUIData)
                        }

                    }
                }
            }

        }
        .padding()

    }

    

    
    var discription: some View {
        
        VStack(alignment: .leading){
            
            Text("Description")
                .bold()
            
            TextEditor(text: $markAddItemVM.itemDescription)
                .placeholder(when: markAddItemVM.itemDescription.isEmpty, placeholder: {
                    Text("Enter Name").foregroundColor(.gray)
                })
                .padding(2)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color .lightGray))
                .foregroundColor(Color .black)
                .frame(height: 100)
            
        }
        .padding()

    }
    
    var submiButton: some View {
        
        VStack(alignment: .center){
            
            ZStack{
                  RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)

                    VStack(alignment: .center){
                      Text("Submit Post")
                            .bold()
                          .foregroundColor(Color.white)
                  }
                  .padding(.horizontal)

              }
              .frame(width: 200, height: 45, alignment: .center)
            
        }
        .padding()
    }
    
    
    var imageView: some View {
        
        VStack{
            if markAddItemVM.isImageSelected == false{
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
                .frame(width: 150, height: 150, alignment: .center)
            }
            else {
                Image(uiImage: markAddItemVM.userSelectedImage!)
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
            }
        }
        

        

    }
    
    
    var titleInput: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                
                VStack(alignment: .leading){
                    
                    Spacer()
                    
                    Text("Title")
                        .bold()
                    
                    TextEditor(text: $markAddItemVM.itemName)
                        .placeholder(when: markAddItemVM.itemName.isEmpty, placeholder: {
                            Text("Enter Name").foregroundColor(.gray)
                        })
                        .padding(2)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color .lightGray))
                        .foregroundColor(Color .black)
                        .frame(width: 150, height: 150, alignment: .center)

                    Spacer()
                    
                }
                .frame(width: 175, height: 175, alignment: .center)

                Spacer()
                
                VStack(alignment: .leading){

                    Text("Image")
                        .bold()
                    
                    Button {
                        delegate?.addImageButtonPressed()
                    } label: {
                        imageView
                    }


                }
                .frame(width: 175, height: 175, alignment: .center)


            }

        }
        .padding()


    }

}
