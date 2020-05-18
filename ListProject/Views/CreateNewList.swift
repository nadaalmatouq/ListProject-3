//
//  CreateNewList.swift
//  ListProject
//
//  Created by Nada Alm on 5/15/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//


import SwiftUI



struct Lists: View {

    @Binding var listName: String
  
    var index: Int
    
    var body: some View {
        
        
        ZStack{
            
            
            Image(listName).resizable().scaledToFill()
            
            Color("light orange").opacity(0.2)
            
            VStack{
                HStack{
                    
                    Image("left arrow").resizable().frame(width: 30, height: 30).padding(.horizontal,10).padding(.trailing,30)
                    
                    
                    
                    Text(listName).font(.system(size: 35, weight: .bold, design: .rounded))
                    
                    
                    
                    Image("right arrow").resizable().frame(width: 30, height: 30).padding(.leading,30)
                    
                    
                    
                    
                }.frame(width: 420, height: 200).offset(x:-17)//HStack
              
               // if index == 0 {
                
                NavigationLink(destination: TravelListDetails()){
              
                    
                    Text("Create").font(.system(size: 25)).foregroundColor(.black).frame(width: 180, height: 60).background(Color("Background")).clipShape(Capsule()).offset(x:-10)
              
                }//NavigationLink
                    
                    
                    
              //  }//if
                
                
              
                
                
                
                
                
            }.offset(y:50)//VStack
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}




struct CreateNewList: View {
    @State private var scrollEffectValue: Double = 13
     @State private var activePageIndex: Int = 0
     
    
    @State var listName: [String] = ["Travel List","Grocery List","Celebration List"]
    
    
     let pageWidth: CGFloat = 380
     let pagePadding: CGFloat = 20
     let numberOfPages: Int = 3
    var body: some View {

      
            VStack {
        
        GeometryReader { geometry in
            PagingScrollView(activePageIndex: self.$activePageIndex, itemCount:self.numberOfPages ,pageWidth:geometry.size.width, tileWidth:self.pageWidth, tilePadding: self.pagePadding){
                ForEach(0 ..< self.numberOfPages) { index in
                    GeometryReader { geometry2 in
                        Lists(listName: self.$listName[index], index: index)
                            .onTapGesture {
                                print ("tap on index: \(index)")
                            }
                    }
                }
            
        }
        
        }
    }
    }
}

struct CreateNewList_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewList()
    }
}
