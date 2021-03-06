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
    var remaining:  String
    
}



struct CreateNewList: View {
    @EnvironmentObject var env: Env
    @Environment(\.presentationMode) var presentationMode
    @Binding var isEdit : Bool // this var will be passed from main list, to make the save as edit array , not new one
    @State var createT = "Create"
    @State var createC = "Create"
    @State var createS = "Create"
    @State var addListName : String = ""
    @State var addListBudget : String = ""
    @State var showTravelOnly = true
    @State var showCelebrationOnly = true
    @State var showShoppingOnly = true
    @State var showingAlert = false
    var body: some View {
        ZStack{
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            NavigationLink(destination: TravelListDetails(isEdit: $isEdit).environmentObject(self.env), isActive: self.$env.itsatravelList){
                EmptyView()
            }.isDetailLink(self.env.taskDone)
            NavigationLink(destination: celebrationDetailsList(isEdit: $isEdit).environmentObject(self.env), isActive: self.$env.itsaCelebrationList){
                EmptyView()
            }.isDetailLink(false)
            
            NavigationLink(destination: ShoppingListDetail(isEdit: $isEdit).environmentObject(self.env), isActive: self.$env.itsaShoppingList){
                EmptyView()
            }.isDetailLink(false)
            
            
            VStack(alignment: .center, spacing: 20){
                // for travel list :
                if ( showTravelOnly ) {   // to show it in create , if some other list created here , it will dispare
                    Group{
                        Button(action:  {
                            self.env.currentListType = self.env.types[0]
                            self.env.sheetT.toggle()
                            // self.createT = "Create"
                            //  print("\(self.env.sheetT)")
                            self.showShoppingOnly.toggle()
                            self.showCelebrationOnly.toggle()
                        }){
                            Image("Travellist")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 340, height: 170)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 20)) 
                        }
                        
                        if  self.env.sheetT{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("light pink")).opacity(0.5)
                                    .frame(width: 340, height: 160, alignment: .center)
                                VStack{
                                    HStack {
                                        Text("Name your list: ")
                                        TextField("Enter a Name", text: self.$addListName)
                                    }.frame(width: 320, alignment: .leading)
                                    HStack {
                                        Text("Setup your Budget: ")
                                        TextField("Enter Budget", text: self.$addListBudget)
                                    }.frame(width: 320, alignment: .leading)
                                    Button(action: {
                                        if (self.addListName) != "" {
                                            self.env.currentLista = Lista(givenName: self.addListName, budget: self.addListBudget, id: UUID(), type: self.env.currentListType, remaining: "")
                                            self.env.currentTravelList.lista = self.env.currentLista
                                            self.addListName = ""
                                            self.addListBudget = ""
                                            self.showShoppingOnly.toggle()
                                            self.showCelebrationOnly.toggle()
                                            self.env.sheetT = false
                                            self.env.itsatravelList = true
                                        }
                                        else {
                                            self.showingAlert = true
                                        }
                                    }){
                                        Text("Next")
                                            .foregroundColor(Color(.black))
                                            .font(.largeTitle)
                                    }.alert(isPresented: $showingAlert) {
                                        Alert(title: Text("Name can't be empty"), message: Text("Please add a name"), dismissButton: .default(Text("Continue")){
                                            self.showingAlert = false
                                            
                                            })
                                    }
                                }
                            }
                        }
                    }
                }
                // for celebration list
                if showCelebrationOnly {   // to show it in create , if some other list created here , it will dispare
                    Group{
                        Button(action:  {
                            self.env.currentListType = self.env.types[1]
                            self.env.sheetC.toggle()
                            //   self.createC = "Create"
                            //  print("\(self.env.sheetC)")
                            self.showShoppingOnly.toggle()
                            self.showTravelOnly.toggle()
                        }){
                            Image("Celebration")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 340, height: 170)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        if  self.env.sheetC{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("light pink")).opacity(0.5)
                                    .frame(width: 340, height: 160, alignment: .center)
                                VStack{
                                    HStack {
                                        Text("Name your list: ")
                                        TextField("Enter a Name", text: self.$addListName)
                                    }.frame(width: 320, alignment: .leading)
                                    HStack {
                                        Text("Setup your Budget: ")
                                        TextField("Enter Budget", text: self.$addListBudget)
                                    }.frame(width: 320, alignment: .leading)
                                    Button(action: {
                                        if (self.addListName) != "" {
                                            self.env.currentLista = Lista(givenName: self.addListName, budget: self.addListBudget, id: UUID(), type: self.env.currentListType, remaining: "")
                                            self.env.currentCelebrationList.lista = self.env.currentLista
                                            self.addListName = ""
                                            self.addListBudget = ""
                                            self.showShoppingOnly.toggle()
                                            self.showTravelOnly.toggle()
                                            self.env.sheetC = false
                                            self.env.itsaCelebrationList = true
                                        }
                                        else {
                                            self.showingAlert = true
                                        }
                                    }){
                                        Text("Next")
                                            .foregroundColor(Color(.black))
                                            .font(.largeTitle)
                                    }.alert(isPresented: $showingAlert) {
                                        Alert(title: Text("Name can't be empty"), message: Text("Please add a name"), dismissButton: .default(Text("Continue")){
                                            self.showingAlert = false
                                            
                                            })
                                    }
                                }
                            }
                        }
                    }
                }
                // for shopping list
                if showShoppingOnly{   // to show it in create , if some other list created here , it will dispare
                    Group{
                        Button(action:  {
                            self.env.currentListType = self.env.types[2]
                            self.env.sheetS.toggle()
                            //self.createS = "Create"
                            //  print("\(self.env.sheetS)")
                            self.showCelebrationOnly.toggle()
                            self.showTravelOnly.toggle()
                        }){
                            Image("sh")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 340, height: 170)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        if  self.env.sheetS{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("light pink")).opacity(0.5)
                                    .frame(width: 340, height: 160, alignment: .center)
                                VStack{
                                    HStack {
                                        Text("Name your list: ")
                                        TextField("Enter a Name", text: self.$addListName)
                                    }.frame(width: 320, alignment: .leading)
                                    HStack {
                                        Text("Setup your Budget: ")
                                        TextField("Enter Budget", text: self.$addListBudget)
                                    }.frame(width: 320, alignment: .leading)
                                    Button(action: {
                                        if (self.addListName) != "" {
                                            self.env.currentLista = Lista(givenName: self.addListName, budget: self.addListBudget, id: UUID(), type: self.env.currentListType, remaining: "")
                                            self.env.currentShoppingList.lista = self.env.currentLista
                                            self.addListName = ""
                                            self.addListBudget = ""
                                            self.showCelebrationOnly.toggle()
                                            self.showTravelOnly.toggle()
                                            self.env.sheetS = false
                                            self.env.itsaShoppingList = true
                                        }
                                        else {
                                            self.showingAlert = true
                                        }
                                    }){
                                        Text("Next")
                                            .foregroundColor(Color(.black))
                                            .font(.largeTitle)
                                    }.alert(isPresented: $showingAlert) {
                                        Alert(title: Text("Name can't be empty"), message: Text("Please add a name"), dismissButton: .default(Text("Continue")){
                                            self.showingAlert = false
                                            
                                            })
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
            
        .onAppear() {
            if self.env.taskDone {
                self.presentationMode.wrappedValue.dismiss()
                self.env.taskDone.toggle()
            }
        }
        
        
    }
    
}
