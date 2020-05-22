//
//  MainList.swift
//  ListProject
//
//
/* problems we've faced:
 
 *the image we want it to be a uiimage and not a string in our struct // hasan
 
 */
//
//

import SwiftUI

struct MainList: View {
    
    @EnvironmentObject var env: Env
    // @State var OverallList : [OverallList] = TotalList
    @State var isEditTravel = false // this var to make the array edit not append new one
    @State var isEdit = false
    @State var isEditShopping = false
    @State var isEditCeleb = false
    var backgroungColor = "Background"
    @State var isWorkWillAdd = false
    @State var isWorkWillEditT = false
    @State var isWorkWillEditC = false
    @State var isWorkWillEditS = false
    @State var isWorkWillEdit = false   //DONT FORGET TO TOGGLE IT SO WHEN YOU COME BACK AFTER THE FIRST TIME ITS NOT ALWAYS TRUE
    @State var nameList = ""
    var body: some View {
        NavigationView{
            ZStack {
                Color(backgroungColor)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                 
                    HStack{
                        NavigationLink(destination: CreateNewList(isEdit: $isEdit).environmentObject(self.env), isActive: $isWorkWillAdd){
                            Text("")
                        }
//                        NavigationLink(destination: TravelListDetails(isEdit: $isEditTravel).environmentObject(self.env), isActive: $isWorkWillEditT){
//                            Text("")
//                        }
//                        NavigationLink(destination: celebrationDetailsList(isEdit: $isEditCeleb).environmentObject(self.env), isActive: $isWorkWillEditC){
//                            Text("")
//                        }
//                        NavigationLink(destination: ShoppingListDetail(isEdit: $isEditShopping).environmentObject(self.env), isActive: $isWorkWillEditS){
//                            Text("")
//                        }
                        
                    }
                    
                     
                            
                            
                    VStack{
                        List{
                            VStack{
                        Text(self.env.currentTravelList.lista.type.name())
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.system(size:24))
                    
                    
                    
                                ScrollView(.horizontal){
                                    HStack{
                    ForEach(self.env.alltravelLists, id: \.self){ i in
                     
                            Text(i.lista.givenName)
                                .foregroundColor(Color.black)
                                .bold()
                                .font(.system(size:24))
                      
                            
                            .onTapGesture {
                                self.isWorkWillEditT = true
                                self.env.currentTravelList = i
                                self.isEditTravel = true
                                //print(self.env.alltravelLists)
                                
                        }
                      
                    }.sheet(isPresented: $isEditTravel) {
                        TravelListDetails(isEdit: self.$isEditTravel).environmentObject(self.env)
                    }
                    }
                                     }
                      }
                    VStack{
                        
                        Text(self.env.currentCelebrationList.lista.type.name())
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.system(size:24))
                        ScrollView(.horizontal){
                        
                         HStack{
                        ForEach(self.env.allCelebrationLists, id: \.self){ i in
                            
                                
                                Text(i.lista.givenName)
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .font(.system(size:24))
                     
                                
                                .onTapGesture {
                                    self.isWorkWillEditC = true
                                    self.env.currentCelebrationList = i
                                    self.isEditCeleb = true
                                    //print(self.env.alltravelLists)
                                    
                            }
                            
                            
                        }.sheet(isPresented: $isEditCeleb) {
                            celebrationDetailsList(isEdit: self.$isEditCeleb).environmentObject(self.env)
                            
                        }
                             }
                            }
                    }
                    VStack{
                        
                        Text(self.env.currentShoppingList.lista.type.name())
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.system(size:24))
                        
                        
                        ScrollView(.horizontal){
                             HStack{
                        ForEach(self.env.allShoppingLists, id: \.self){ i in
                           
                                Text(i.lista.givenName)
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .font(.system(size:24))
                       
                                
                                .onTapGesture {
                                    self.isWorkWillEditS = true
                                    self.env.currentShoppingList = i
                                    self.isEditShopping = true
                                    //print(self.env.alltravelLists)
                                    
                            }
                        }.sheet(isPresented: $isEditShopping) {
                        
                            ShoppingListDetail(isEdit: self.$isEditShopping).environmentObject(self.env)
                           }
                             }
                        }
                    }
                    
                     }
                     }
                
                }
                    
                .navigationBarTitle(Text("To Do List"))
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isWorkWillAdd = true
                        
                    }) {
                        Image(systemName: "plus.circle").imageScale(.large)
                            .foregroundColor(Color("red"))
                            .font(.system(size: 25))
                    }
                )
                  
            }.colorMultiply(Color(backgroungColor))
            .navigationBarBackButtonHidden(true)
        }
    }
}



struct MainList_Previews: PreviewProvider {
    static var previews: some View {
        MainList().environmentObject(Env())
    }
}
