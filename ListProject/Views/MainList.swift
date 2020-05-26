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
    @Environment(\.presentationMode) var presentationMode
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
              //  Color(backgroungColor)
               Image("bac")
                .resizable()
                .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
//                        NavigationLink(destination: CreateNewList(isEdit: $isEdit).environmentObject(self.env), isActive: $isWorkWillAdd){
//                            Text("")
//                        }
//                        NavigationLink(destination: TravelListDetails(isEdit: $isEditTravel).environmentObject(self.env), isActive: $isWorkWillEditT){
//                            Text("")
//                        }
//                        NavigationLink(destination: celebrationDetailsList(isEdit: $isEditCeleb).environmentObject(self.env), isActive: $isWorkWillEditC){
//                            Text("")
//                        }
//                        NavigationLink(destination: ShoppingListDetail(isEdit: $isEditShopping).environmentObject(self.env), isActive: $isWorkWillEditS){
//                            Text("")
//                        }
                        Text("")
                    }
                    ZStack{
                        Color(.white)
                          //  .opacity(0.8)
                    VStack(spacing: 10){
                        ScrollView(.vertical){
                           
                            VStack{
                        Text(self.env.currentTravelList.lista.type.name())
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.custom("Skia Light", size: 24))
                            
                          //  .font(.system(size:24))
                                
                                ScrollView(.horizontal){
                                    HStack{
                                    
                    ForEach(self.env.alltravelLists, id: \.self){ i in
                        VStack{
                        Image(uiImage: i.picture!)
                            .resizable()
                            .frame(width: 130, height: 130)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            Text(i.lista.givenName)
                                .foregroundColor(Color.black)
                                .bold()
                                .font(.system(size:24))
                        }.onTapGesture {
                        self.isWorkWillEditT = true
                        self.env.currentTravelList = i
                        self.isEditTravel = true
                        }.padding(.all, 20)
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
                            VStack{
                            Image(uiImage: i.picture!)
                                .resizable()
                                .frame(width: 130, height: 130)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                Text(i.lista.givenName)
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .font(.system(size:24))
                                
                            }.onTapGesture {
                            self.isWorkWillEditC = true
                            self.env.currentCelebrationList = i
                            self.isEditCeleb = true
                            }.padding(.all, 20)
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
                               VStack{
                                Image(uiImage: i.picture!)
                                    .resizable()
                                    .frame(width: 130, height: 130)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                    Text(i.lista.givenName)
                                        .foregroundColor(Color.black)
                                        .bold()
                                        .font(.system(size:24))
                                    
                                }.onTapGesture {
                                self.isWorkWillEditS = true
                                self.env.currentShoppingList = i
                                self.isEditShopping = true
                                }.padding(.all, 20)
                        }.sheet(isPresented: $isEditShopping) {
                            ShoppingListDetail(isEdit: self.$isEditShopping).environmentObject(self.env)
                           }
                             }
                        }
                    }
                     }
                        
                    }.padding(.vertical)
                        .padding(.horizontal, 60)
                    }
                        NavigationLink(destination: CreateNewList(isEdit: $isEdit).environmentObject(self.env), isActive:
                        self.$env.taskDone2){
                            HStack{
                            Image(systemName: "plus").imageScale(.large)
                                .font(.system(size: 20))
                                .foregroundColor(Color(.white))
                            .frame(width: 60, height: 60)
                            .background(Color("blue"))
                                .clipShape(Circle())
                            
                                .padding(.vertical,10)
                                .shadow(radius: 10)
                            }
                        }.isDetailLink(self.env.taskDone)
                            .onTapGesture {
                                self.env.taskDone2.toggle()
                        }
                        
                    
                }
                .navigationBarTitle(Text("To Do List"))
                //.navigationBarItems(trailing:
                    
                
              //  )
           
                    // the above navigation is instead of the below , and i remove navigation from the beginning of the page
//                    Button(action: {
//                        self.isWorkWillAdd = true
//
//                    }) {
//                        Image(systemName: "plus.circle").imageScale(.large)
//                            .foregroundColor(Color("red"))
//                            .font(.system(size: 25))
//                    }
              
            }.colorMultiply(Color(backgroungColor))
            .navigationBarBackButtonHidden(true)
                .onAppear {
                    self.env.sheetT = false
                    self.env.sheetC = false
                    self.env.sheetS = false
            }
        }
    }


}

struct MainList_Previews: PreviewProvider {
    static var previews: some View {
        MainList().environmentObject(Env())
    }
}
