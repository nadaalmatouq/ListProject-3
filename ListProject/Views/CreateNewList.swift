//
//  CreateNewList.swift
//  ListProject
//
//  Created by Nada Alm on 5/15/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//


import SwiftUI


struct Lista : Hashable, Identifiable{
    var givenName:  String
    var budget:  String
    var id : UUID
    var type: Type
   //  var Picture : Image
    
}


struct CreateNewList: View {
    
    @State private var scrollEffectValue: Double = 13
    @State private var activePageIndex: Int = 0
      @EnvironmentObject var env: Env
 

       @State var sheetViewStatus : Bool = false
    
       @State var addListName: String = ""
       @State var addListBudget: String = ""
    
    
     let pageWidth: CGFloat = 380
     let pagePadding: CGFloat = 20
     let numberOfPages: Int = 3
    
       @Binding var isEdit : Bool // this var will be passed from main list, to make the save as edit array , not new one
    
    var body: some View {

      
            VStack {
        
        GeometryReader { geometry in
            PagingScrollView(activePageIndex: self.$activePageIndex, itemCount:self.numberOfPages ,pageWidth:geometry.size.width, tileWidth:self.pageWidth, tilePadding: self.pagePadding){
                ForEach(self.env.types, id: \.self) { typpe in
                    GeometryReader { geometry2 in
                        SingleListView(currentListType: typpe, sheetViewStatus: self.$sheetViewStatus, addListName: self.$addListName,addListBudget: self.$addListBudget, isEdit: self.$isEdit)
                            
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
   
    @EnvironmentObject var env: Env
    @State var currentListType: Type
    @Binding var sheetViewStatus : Bool
    @Binding var addListName: String
    @Binding var addListBudget: String

    
    @Binding var isEdit : Bool // this var will be passed from main list, to make the save as edit array , not new one
    
    var body: some View {
        
        
        ZStack{
            
            HStack{
                NavigationLink(destination: TravelListDetails(isEdit: $isEdit).environmentObject(self.env), isActive: self.$env.itsatravelList){
//                    EmptyView()
                    Text("")
                }
                NavigationLink(destination: celebrationDetailsList(isEdit: $isEdit).environmentObject(self.env), isActive: self.$env.itsaCelebrationList){
//                   EmptyView()
                           Text("")

                }

                NavigationLink(destination: ShoppingListDetail(isEdit: $isEdit).environmentObject(self.env), isActive: self.$env.itsaShoppingList){
//                   EmptyView()
                           Text("")
                }
                
                
            }/*.onDisappear(perform: {     self.env.itsatravelList = false
                          
                      
                          self.env.itsaCelebrationList = false
                          
                      
                          
                          self.env.itsaShoppingList = false     }) */
            
            
            
            Image(currentListType.name()).resizable().scaledToFill()
            
            Color("light orange").opacity(0.2)
            
            VStack{
                HStack{
                    
                    Image("left arrow").resizable().frame(width: 30, height: 30).padding(.horizontal,10).padding(.trailing,30)
                    
                    
                    
                    Text(currentListType.name()).font(.system(size: 35, weight: .bold, design: .rounded))
                    
                    
                    
                    Image("right arrow").resizable().frame(width: 30, height: 30).padding(.leading,30)
                    
                    
                    
                    
                }.frame(width: 420, height: 200).offset(x:-17) .onTapGesture {
                   
                    print ("tap on Single LIstView: \(self.currentListType)")}
              
              
              
              
                    
                Button(action:  {
                    self.env.currentListType = self.currentListType
                    
                      self.sheetViewStatus.toggle()//triggers sheet to be presented
                    
                    print("env.currentListType: \(self.env.currentListType)")
                    
                }){
                    
                    Text("Create").font(.system(size: 25)).foregroundColor(.black).frame(width: 180, height: 60).background(Color("Background")).clipShape(Capsule()).offset(x:-10)
                    
                    
                }.sheet(isPresented: $sheetViewStatus) {
                    
                    
                    SheetView(sheetViewStatus: self.$sheetViewStatus, addListName: self.$addListName,addListBudget: self.$addListBudget, currentListType: self.env.currentListType).environmentObject(self.env)

                }//sheet is presented
              
            }.offset(y:50)//VStackSheetView
         
            }.edgesIgnoringSafeArea(.all)
        
    }
}


struct SheetView: View {
   // @Binding var lists : [Lista]
    @EnvironmentObject var env: Env
 
    
    @Binding var sheetViewStatus : Bool
    
      @Binding var addListName: String
      @Binding var addListBudget: String
    
    var currentListType: Type

      
       
   
    
    var body: some View{
    VStack {
        HStack {
            Text("Give your list a name: ")
            Spacer()
            TextField("Enter your Name", text: self.$addListName)
        }.onTapGesture {
            print ("tap on index: \(self.currentListType)")}
        HStack {
            Text("Setup your Budget: ").font(.system(size: 20))
             Spacer()
            TextField("Enter Budget", text: self.$addListBudget)
            
        }
        
       
        Button(action: {
            
            self.sheetViewStatus.toggle() //turn off sheet View
             print(self.sheetViewStatus)
          
            
            self.env.currentListType = self.currentListType
          
            self.env.currentLista = Lista(givenName: self.addListName, budget: self.addListBudget, id: UUID(), type: self.env.currentListType)
//            self.env.lists.append(self.env.currentLista) //save in Lists array that has all the lists of all types
            
            
            if  (self.env.currentLista.type == .travel){
            
            self.env.currentTravelList.lista = self.env.currentLista
                self.env.itsatravelList = true
                
            }
            else if  (self.env.currentLista.type == .celebration){
            
            self.env.currentCelebrationList.lista = self.env.currentLista
                self.env.itsaCelebrationList = true
                
            }
            else {
                
                
                self.env.currentShoppingList.lista = self.env.currentLista
                //SHOULD BE ADDED ... done
                self.env.itsaShoppingList = true
                
            }
            
            
            
          
            print(self.env.lists)
            print(self.env.currentTravelList.lista)
            
        
        
            
            
            
            // Reset Values
            self.addListName = ""
            self.addListBudget = ""
         
            
        }, label: {
    
            Text("Continue").foregroundColor(Color("orange button")).font(.largeTitle)
     
            
            })
        
     
    }
    .padding(100)
}
}



//struct CreateNewList_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        CreateNewList().environmentObject(Env())
//    }
//}
