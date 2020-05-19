//
//  CreateNewList.swift
//  ListProject
//
//  Created by Nada Alm on 5/15/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//


import SwiftUI


struct Lista : Hashable{
    var givenName:  String
    var budget:  String
     
    var type: Type
    
    
}


struct CreateNewList: View {
    @State private var scrollEffectValue: Double = 13
    @State private var activePageIndex: Int = 0
      @EnvironmentObject var env: Env
    
  

       @State var sheetViewStatus : Bool
    
       @State var addListName: String = ""
       @State var addListBudget: String = ""
    
    
     let pageWidth: CGFloat = 380
     let pagePadding: CGFloat = 20
     let numberOfPages: Int = 3
    var body: some View {

      
            VStack {
        
        GeometryReader { geometry in
            PagingScrollView(activePageIndex: self.$activePageIndex, itemCount:self.numberOfPages ,pageWidth:geometry.size.width, tileWidth:self.pageWidth, tilePadding: self.pagePadding){
                ForEach(self.env.types, id: \.self) { typpe in
                    GeometryReader { geometry2 in
                        SingleListView(currentListType: typpe, sheetViewStatus: self.$sheetViewStatus, addListName: self.$addListName,addListBudget: self.$addListBudget)
                            
                            .onTapGesture {
                                print ("tap on index: \(typpe)")
                            }
                    }//geometry Reader
                    
                    
                    
                    
                    
                }//For Each
            
        }
        
        }
    }
    }
}


struct SingleListView: View {
   // @Binding var listName: String
    @State var currentListType: Type
   @EnvironmentObject var env: Env
    @Binding var sheetViewStatus : Bool
  //  @Binding var lists : [Lista]
    @Binding var addListName: String
    @Binding var addListBudget: String
    
  
    
    var body: some View {
        
        
        ZStack{
            
            
            Image(currentListType.name()).resizable().scaledToFill()
            
            Color("light orange").opacity(0.2)
            
            VStack{
                HStack{
                    
                    Image("left arrow").resizable().frame(width: 30, height: 30).padding(.horizontal,10).padding(.trailing,30)
                    
                    
                    
                    Text(currentListType.name()).font(.system(size: 35, weight: .bold, design: .rounded))
                    
                    
                    
                    Image("right arrow").resizable().frame(width: 30, height: 30).padding(.leading,30)
                    
                    
                    
                    
                }.frame(width: 420, height: 200).offset(x:-17)//HStack
              
              
              
              
                    
                Button(action:  {
                    
                      self.sheetViewStatus.toggle()
                 
                    
                }){
                    
                    Text("Create").font(.system(size: 25)).foregroundColor(.black).frame(width: 180, height: 60).background(Color("Background")).clipShape(Capsule()).offset(x:-10)
                    
                    
                }
              
            }.offset(y:50)//VStackSheetView
            
        }.edgesIgnoringSafeArea(.all).sheet(isPresented: $sheetViewStatus) {
            
            
            SheetView(sheetViewStatus: self.$sheetViewStatus, addListName: self.$addListName,addListBudget: self.$addListBudget, currentListType: self.currentListType)

        }//sheet is presented
        
    }
}

struct DecideCorrespondingView: View {

    var index: Int
var body: some View{
    
    
    Text("")
    
    
    
    }

}



struct SheetView: View {
   // @Binding var lists : [Lista]
    @EnvironmentObject var env: Env
    @Binding var sheetViewStatus: Bool
    @Binding var addListName: String
    @Binding var addListBudget: String
    var currentListType: Type
   
    
    var body: some View{
    VStack {
        HStack {
            Text("Give your list a name: ")
            Spacer()
            TextField("Enter your Name", text: self.$addListName)
        }
        HStack {
            Text("Setup your Budget: ").font(.system(size: 20))
             Spacer()
            TextField("Enter Budget", text: self.$addListBudget)
            
        }
        
       
        Button(action: {
               self.env.currentListType = self.currentListType
          
            self.env.lists.append(Lista(givenName: self.addListName, budget: self.addListBudget, type: self.env.currentListType)) //save in Lists array
          //when continuebool is true toggled here when pressing cotinue func is called we pass index to singleview and then cal function to check what the index is and navigate to the corresponding view
            self.sheetViewStatus.toggle()
            
            print(self.env.lists)
            
            // Reset Values
            self.addListName = ""
            self.addListBudget = ""
            
            
        }, label: {
    
            Text("Continue").foregroundColor(Color("orange button")).font(.largeTitle)
            
            
        })
        
     
    }.padding(100)
}
}

struct CreateNewList_Previews: PreviewProvider {
    
    static var previews: some View {
        CreateNewList(sheetViewStatus: false).environmentObject(Env())
    }
}
