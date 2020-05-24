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
    @State var changeOffsetT : CGFloat = 0
    @State var changeOffsetC : CGFloat = 0
    @State var changeOffsetS : CGFloat = 0
    @State var createT = "Create"
    @State var createC = "Create"
    @State var createS = "Create"
    @State var addListName : String = ""
    @State var addListBudget : String = ""
     var body: some View {
        ZStack{
                        NavigationLink(destination: TravelListDetails(isEdit: $isEdit).environmentObject(self.env), isActive: self.$env.itsatravelList){
                          EmptyView()
                        }.isDetailLink(self.env.taskDone)
                        NavigationLink(destination: celebrationDetailsList(isEdit: $isEdit).environmentObject(self.env), isActive: self.$env.itsaCelebrationList){
                           EmptyView()
                        }//.isDetailLink(false)

                        NavigationLink(destination: ShoppingListDetail(isEdit: $isEdit).environmentObject(self.env), isActive: self.$env.itsaShoppingList){
                          EmptyView()
                        }//.isDetailLink(false)
            GeometryReader { geometry in
            ScrollView(.horizontal){
                HStack{
        // for travel:
                ZStack{
                Image(self.env.types[0].name())
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                           Color("light orange").opacity(0.2)
                    VStack{
                           VStack{
                               HStack{

                                   Image("left arrow").resizable().frame(width: 30, height: 30).padding(.horizontal,10).padding(.trailing,30)

                                Text(self.env.types[0].name()).font(.system(size: 35, weight: .bold, design: .rounded))

                                   Image("right arrow").resizable().frame(width: 30, height: 30).padding(.leading,30)

                               }.frame(width: 420, height: 200).offset(x:-17)

                             Button(action:  {
                                 self.env.currentListType = self.env.types[0]
                                self.env.sheetT.toggle()
                                   //self.env.sheetT = true//triggers sheet to be presented
                                self.createT = "Create"
                                print("\(self.env.sheetT)")
                                self.changeOffsetT = -100
                             }, label: {

                                Text(self.createT).font(.system(size: 25)).foregroundColor(.black).frame(width: 180, height: 60).background(Color("Background")).clipShape(Capsule()).offset(x:-10)
                            })
                           }.offset(y: self.changeOffsetT)
                            if  self.env.sheetT{
                                ZStack{
                                  //  Rectangle()
                                        RoundedRectangle(cornerRadius: 50)
                                           .fill(Color("blue button"))

                                        .frame(width: 340, height: 180, alignment: .center)
                                VStack{
                                    
                                    HStack {
                                        Text("Your list a name: ")
                                        
                                        TextField("Enter your Name", text: self.$addListName)
                                    }.frame(width: 320, alignment: .leading)
                                    HStack {
                                        Text("Setup your Budget: ")
                                         
                                        TextField("Enter Budget", text: self.$addListBudget)

                                    }.frame(width: 320, alignment: .leading)
                                    Button(action: {

                                                self.env.currentLista = Lista(givenName: self.addListName, budget: self.addListBudget, id: UUID(), type: self.env.currentListType, remaining: "")
                                                self.env.currentTravelList.lista = self.env.currentLista
                                                   
                                        self.addListName = ""
                                        self.addListBudget = ""
                                        self.env.sheetT = false
                                         self.env.itsatravelList = true
                                        
                                    }){

                                            Text("Next").foregroundColor(Color("orange button")).font(.largeTitle)
                                    }.onAppear {
                                        if self.env.sheetT == true {
                                            self.createT = "Cancel"
                                        }
                                        else {
                                             self.createT = "Create"
                                        }
                                    }
//                                    .sheet(isPresented: self.$env.itsatravelList) {
//                                        TravelListDetails(isEdit: self.$isEdit).environmentObject(self.env)

//                                    }

                                    
                                    }
                                } } } }
                    // for celebration
                    ZStack{
                    Image(self.env.types[1].name())
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                               Color("light orange").opacity(0.2)
                        VStack{
                               VStack{
                                   HStack{

                                       Image("left arrow").resizable().frame(width: 30, height: 30).padding(.horizontal,10).padding(.trailing,30)

                                    Text(self.env.types[1].name()).font(.system(size: 35, weight: .bold, design: .rounded))

                                       Image("right arrow").resizable().frame(width: 30, height: 30).padding(.leading,30)

                                   }.frame(width: 420, height: 200).offset(x:-17)

                                 Button(action:  {
                                     self.env.currentListType = self.env.types[1]
                                    self.env.sheetC.toggle()
                                       //self.env.sheetT = true//triggers sheet to be presented
                                    self.createC = "Create"
                                    print("\(self.env.sheetC)")
                                    self.changeOffsetC = -100
                                 }, label: {

                                    Text(self.createC).font(.system(size: 25)).foregroundColor(.black).frame(width: 180, height: 60).background(Color("Background")).clipShape(Capsule()).offset(x:-10)
                                })
                               }.offset(y: self.changeOffsetC)
                                if  self.env.sheetC{
                                    ZStack{
                                      //  Rectangle()
                                            RoundedRectangle(cornerRadius: 50)
                                               .fill(Color("blue button"))

                                            .frame(width: 340, height: 180, alignment: .center)
                                    VStack{
                                        
                                        HStack {
                                            Text("Your list a name: ")
                                            
                                            TextField("Enter your Name", text: self.$addListName)
                                        }.frame(width: 320, alignment: .leading)
                                        HStack {
                                            Text("Setup your Budget: ")
                                             
                                            TextField("Enter Budget", text: self.$addListBudget)

                                        }.frame(width: 320, alignment: .leading)
                                        Button(action: {

                                                    self.env.currentLista = Lista(givenName: self.addListName, budget: self.addListBudget, id: UUID(), type: self.env.currentListType, remaining: "")
                                                    self.env.currentCelebrationList.lista = self.env.currentLista
                                                        self.env.itsaCelebrationList = true
                                            self.addListName = ""
                                            self.addListBudget = ""
                                            self.env.sheetC = false
                                        }, label: {

                                                Text("Next").foregroundColor(Color("orange button")).font(.largeTitle)
                                        }).onAppear {
                                            if self.env.sheetC == true {
                                                self.createC = "Cancel"
                                            }
                                            else {
                                                 self.createC = "Create"
                                            }
                                        }}
                                    } } } }
                    // for shopping
                    ZStack{
                    Image(self.env.types[2].name())
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                               Color("light orange").opacity(0.2)
                        VStack{
                               VStack{
                                   HStack{

                                       Image("left arrow").resizable().frame(width: 30, height: 30).padding(.horizontal,10).padding(.trailing,30)

                                    Text(self.env.types[2].name()).font(.system(size: 35, weight: .bold, design: .rounded))

                                       Image("right arrow").resizable().frame(width: 30, height: 30).padding(.leading,30)

                                   }.frame(width: 420, height: 200).offset(x:-17)

                                 Button(action:  {
                                     self.env.currentListType = self.env.types[2]
                                    self.env.sheetS.toggle()
                                       //self.env.sheetT = true//triggers sheet to be presented
                                    self.createS = "Create"
                                    print("\(self.env.sheetS)")
                                    self.changeOffsetS = -100
                                 }, label: {

                                    Text(self.createS).font(.system(size: 25)).foregroundColor(.black).frame(width: 180, height: 60).background(Color("Background")).clipShape(Capsule()).offset(x:-10)
                                })
                               }.offset(y: self.changeOffsetS)
                                if  self.env.sheetS{
                                    ZStack{
                                      //  Rectangle()
                                            RoundedRectangle(cornerRadius: 50)
                                               .fill(Color("blue button"))

                                            .frame(width: 340, height: 180, alignment: .center)
                                    VStack{
                                        
                                        HStack {
                                            Text("Your list a name: ")
                                            
                                            TextField("Enter your Name", text: self.$addListName)
                                        }.frame(width: 320, alignment: .leading)
                                        HStack {
                                            Text("Setup your Budget: ")
                                             
                                            TextField("Enter Budget", text: self.$addListBudget)

                                        }.frame(width: 320, alignment: .leading)
                                        Button(action: {

                                                    self.env.currentLista = Lista(givenName: self.addListName, budget: self.addListBudget, id: UUID(), type: self.env.currentListType, remaining: "")
                                                    self.env.currentShoppingList.lista = self.env.currentLista
                                                        self.env.itsaShoppingList = true
                                            self.addListName = ""
                                            self.addListBudget = ""
                                            self.env.sheetS = false
                                        }, label: {

                                                Text("Next").foregroundColor(Color("orange button")).font(.largeTitle)
                                        }).onAppear {
                                            if self.env.sheetS == true {
                                                self.createS = "Cancel"
                                            }
                                            else {
                                                 self.createS = "Create"
                                            }
                                        }}
                                    } } } }
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
