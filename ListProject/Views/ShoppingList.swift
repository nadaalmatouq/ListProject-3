//
//  PartyList.swift
//  ListProject
//
//  Created by shaikha alqhtane on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI
struct ContentStruct {
   var listName : String
   var listBudget : String
   var listRemainig : String
   var listClothesAccessories : [AccessorisStruct]
   var listFoodVegetables : [foodStruct]
   var listOthers : [othersStruct]
}

struct AccessorisStruct : Hashable, Identifiable{
    var clothName : String
    var clothPrice : String = ""
    var id = UUID()
}
struct foodStruct : Hashable, Identifiable{
    var foName : String
    var foPrice : String = ""
    var id = UUID()
}
struct othersStruct : Hashable, Identifiable{
    var otherName : String
    var otherPrice : String = ""
    var id = UUID()
}

var arrayOfAccessoris : [AccessorisStruct] = []
var arrayOfFood : [foodStruct] = []
var arrayOfOtherss : [othersStruct] = []
var arrayOfCel123 : [ContentStruct] = []

enum whenClick123 {
    case plus
    case minus
    
    mutating func toggleClick(){
        switch self {
        case .plus : self = .minus
        case .minus : self = .plus
        }
    }
    func textNameClick() -> String {
        switch self {
        case .plus : return "plus.circle"
        case .minus : return "minus.circle"
        }
    }
}



struct ShoppingList: View {
    @State var listName : String = ""
    @State var budgetMon : String = ""
    @State var budgetRem : String = ""
    @State var whenClickAccessoris = whenClick13.plus
    @State var whenClickFood = whenClick13.plus
    @State var whenClickOthers = whenClick13.plus
    @State var isClickAccessoris = false
    @State var isClickFood = false
    @State var isClickOthers = false
    @State var listFoandVe : String = ""
    @State var listCAndA : String = ""
    @State var listOthers: String = ""
    @State var newNameFo : String = ""
    @State var newPriceFo : String = ""
    @State var newNameCloth : String = ""
    @State var newPriceCloth : String = ""
    @State var newNameOth : String = ""
    @State var newPriceOth : String = ""
    @State var refreshNow = false
    @State private var showingAlert = false
    @State var moveToMain = false
    
    
    func calculateTheRemainig(prc : String) {
                         var theRemain : Double = 0.0
                         var theNewPrice : Double = 0.0
                         theNewPrice = Double(prc) ?? 0.0
                         if (self.budgetMon != "" && self.budgetRem == ""){
                             self.budgetRem = self.budgetMon
                             theRemain = Double(self.budgetRem) ?? 0.0
                             self.budgetRem = String(theRemain-theNewPrice)
                             print(theNewPrice)
                         }
                         else if (self.budgetMon != "" && self.budgetRem != ""){
                             theRemain = Double(self.budgetRem) ?? 0.0
                             self.budgetRem = String(theRemain-theNewPrice)
                             print(theNewPrice)
                             print(self.budgetRem)
                         }
                     }
    var body: some View {
        
        ZStack{
        Color("blue button")
            .edgesIgnoringSafeArea(.all)

            ScrollView{
            VStack{
            Spacer()
            Text("Shopping List")
                .background(Color("light orange"))
                .cornerRadius(20)
                .font(.custom("Georgia Regular", size: 50))
               .foregroundColor(Color("pink"))
                .shadow(color:.white, radius: 2)
                .padding(.bottom, 30)
                Image("logo")
            HStack{
                Text("List Name :             ").bold()
                    .background(Color("light orange"))
                    .cornerRadius(90)
                    .font(.custom("Georgia Regular", size: 25))
                .foregroundColor(Color("blue"))
                TextField("Enter your list Name", text: $listName)
                    .frame(width: 200, height: 30, alignment: .leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            VStack{
                HStack{
                    
                    Text("Budget :           ").bold()
                        .background(Color("pink"))
                        .cornerRadius(90)
                        .font(.custom("Georgia Regular", size: 25))
                        .foregroundColor(Color("blue"))
                        .frame(width: 120, height: 0, alignment: .leading)
                        .offset(x:-40)
                    TextField("Enter Budget", text: $budgetMon)
                        .keyboardType(.decimalPad)
                        .frame(width: 150, height: 30, alignment: .leading)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.offset(x:30,y:30)
                
                    HStack{
                    Text("Remaining : ").bold()
                        .background(Color("orange button"))
                        .cornerRadius(20)
                        .font(.custom("Georgia Regular", size: 30))
                        .foregroundColor(Color("blue"))
                        .font(.system(size:30))
                        .frame(width: 180, height: 100, alignment: .leading)
                        
                            TextField("   ..", text: $budgetRem)
                            .frame(width: 150, height: 30, alignment: .leading)
                            .keyboardType(.decimalPad)
                            .background(Color.white)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                   
                }
            
                }
            }.padding(.horizontal)
                .padding(.vertical)
              
        
                 HStack{
         Button(action: {
      self.whenClickAccessoris.toggleClick()
     self.isClickAccessoris.toggle()
            }){
                VStack{
                    HStack{

    Image(systemName:whenClickAccessoris.textNameClick())
    .resizable()
    .frame(width: 20, height: 20, alignment: .center)
    .foregroundColor(Color("blue"))
    Text("Clothes & Accessories")
    Spacer()
    }
                    
                }
                    }
                    
                 }.padding(.horizontal)
    if self.isClickAccessoris {
 VStack{
      Group{
    if arrayOfAccessoris.count >= 0 {
        ForEach(arrayOfAccessoris, id: \.self){ i in
                  HStack{
      Text(i.clothName)
    .frame(width: 190, height: 30, alignment: .center)
     Spacer()
     Text(i.clothPrice)
    .frame(width: 100, height: 30, alignment: .center)
    .background(Color("blue button"))
   }.padding(.vertical,2)
            
        }
if refreshNow{
 Text(newNameCloth)
 
    }
}
     }.padding(.horizontal, 15)
            HStack{
   TextField("Clothes & Accessories", text: self.$newNameCloth)
      .frame(width: 140, height: 30, alignment: .leading)
      .textFieldStyle(RoundedBorderTextFieldStyle())
      TextField("Enter price", text: self.$newPriceCloth)
      .frame(width: 140, height: 30, alignment: .leading)
      .textFieldStyle(RoundedBorderTextFieldStyle())
                  Image(systemName: "plus")
                   .onTapGesture {
                    if (self.newNameCloth == "" && self.newPriceCloth == "")
                    { }
                    else if (self.newNameCloth == ""){
                    }  // only name empty
                     else{
                     if (self.newPriceCloth == ""){
                        self.newPriceCloth = "0.0"
                       }
                        self.refreshNow = true
                        arrayOfAccessoris.append(AccessorisStruct(clothName: self.newNameCloth, clothPrice: self.newPriceCloth))
                            self.calculateTheRemainig(prc: self.newPriceCloth)
                            print(arrayOfAccessoris)
                            self.newNameCloth = ""
            self.newPriceCloth = ""
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    self.refreshNow = false
                                                                                                              }
                                                                                                      }
                                                                                                  }
    }
        }
        
    Group{
        HStack{
            Button(action: {
                self.whenClickFood.toggleClick()
                self.isClickFood.toggle()
                if self.isClickFood {
                    print("test open Food")
                }
            }){
                Image(systemName:whenClickFood.textNameClick())
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(Color("blue"))
                Text("Food & Vegetables")//.modifier(blueColorForAddTitles())
                Spacer()
            }
        }.padding(.horizontal)
        if self.isClickFood {
            VStack{
                Group{
                    if arrayOfFood.count >= 0 {
                        ForEach(arrayOfFood, id: \.self){ i in
                            HStack{
                                Text(i.foName)
                                    //.modifier(blueColorForAddTitles())
                                    .frame(width: 190, height: 30, alignment: .center)
                                
                                Spacer()
                                Text(i.foPrice)
                                    //.modifier(blueColorForAddTitles())
                                    .frame(width: 100, height: 30, alignment: .center)
                                    .background(Color("blue button"))
                            }.padding(.vertical,2)
                        }
                        if refreshNow{
                            Text(newNameFo)
                                //.modifier(blueColorForAddTitles())
                        }
                    }
                }.padding(.horizontal, 15)
                HStack{
                    TextField("Food & Vegetables ", text: self.$newNameFo)
                        .frame(width: 140, height: 30, alignment: .leading)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Enter price", text: self.$newPriceFo)
                        .frame(width: 140, height: 30, alignment: .leading)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Image(systemName: "plus")
                        .onTapGesture {
                            if (self.newNameFo == "" && self.newPriceFo == "")
                            { }  // if both field empty
                            else if (self.newNameFo == ""){
                            }  // only name empty
                            else{
                                if (self.newPriceFo == ""){
                                    self.newPriceFo = "0.0"
                                } // only price empty will continue
                                self.refreshNow = true
                                arrayOfFood.append(foodStruct(foName: self.newNameFo, foPrice: self.newPriceFo))
                                self.calculateTheRemainig(prc: self.newPriceFo)
                                print(arrayOfFood)
                                self.newNameFo = ""
                                self.newPriceFo = ""
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                self.refreshNow = false
                            }
                    }
                }
            }
        }
    }
    Group{
     HStack{
       Button(action: {
          self.whenClickOthers.toggleClick()
          self.isClickOthers.toggle()
          if self.isClickOthers {
           print("test open other")
           }
           }){
        Image(systemName:whenClickOthers.textNameClick())
            .resizable()
             .frame(width: 20, height: 20, alignment: .center)
             .foregroundColor(Color("blue"))
             Text("Others")
         Spacer()
                    }
               }.padding(.horizontal)
          if self.isClickOthers {
    VStack{
          Group{
              if arrayOfOthers.count >= 0 {
             ForEach(arrayOfOthers, id: \.self){ i in
             HStack{
              Text(i.otherName)
                
               .frame(width: 190, height: 30, alignment: .center)
                Spacer()
                Text(i.otherPrice)
                
                 .frame(width: 100, height: 30, alignment: .center)
                 .background(Color("blue button"))
                }.padding(.vertical,2)
                     }
            if refreshNow{
            Text(newNameOth)
               
         }
      }
    }.padding(.horizontal, 15)
    HStack{
     TextField("Enter other", text: self.$newNameOth)
          .frame(width: 140, height: 30, alignment: .leading)
          .textFieldStyle(RoundedBorderTextFieldStyle())
           TextField("Enter price", text: self.$newPriceOth)
           .frame(width: 140, height: 30, alignment: .leading)
           .textFieldStyle(RoundedBorderTextFieldStyle())
            Image(systemName: "plus")
             .onTapGesture {
             if (self.newNameOth == "" && self.newPriceOth == "")
             { }  // if both field empty
              else if (self.newNameOth == ""){
        }  // only name empty
        else{
         if (self.newPriceOth == ""){
           self.newPriceOth = "0.0"
     } // only price empty will continue
         self.refreshNow = true
          arrayOfOtherss.append(othersStruct(otherName: self.newNameOth, otherPrice: self.newPriceOth))
           self.calculateTheRemainig(prc: self.newPriceOth)
              print(arrayOfOthers)
              self.newNameOth = ""
              self.newPriceOth = ""
              UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                self.refreshNow = false
          }
         }
      }
          }
                     }
       Spacer()
       Group{
       HStack{
       Button(action: {
        let newCelb = ContentStruct( listName: self.listName, listBudget: self.budgetMon, listRemainig: self.budgetRem,  listClothesAccessories: arrayOfAccessoris, listFoodVegetables: arrayOfFood, listOthers: arrayOfOtherss)
            arrayOfCel123.append(newCelb)
            print(arrayOfCel123)
            self.showingAlert = true
             self.moveToMain = true
               })
               {
     Text("Save")
       .fontWeight(.semibold)
       .font(.custom("Georgia Regular", size: 25))
       .padding(.horizontal, 40)
       .padding(.vertical, 8)
       .foregroundColor(Color("blue"))
       .background(Color("orange button"))
       .cornerRadius(20)
        }
         .alert(isPresented: $showingAlert) {
          Alert(title: Text("Your List is saved successfully"), message: Text(""), dismissButton: .default(Text("Back to main list")))
        }
            Button(action: {
              print(arrayOfCel13)
               })
               {
           Text("Share")
           .fontWeight(.semibold)
           .font(.custom("Georgia Regular", size: 25))
           .padding(.horizontal, 40)
           .padding(.vertical, 8)
           .foregroundColor(Color("blue"))
           .background(Color("pink"))
           .cornerRadius(20)
              }
            }.padding()
        }
       }
                                                                                              
                                                                                        
                                                       }
            }
      
            }
        
   
}
    
                

   

struct ShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingList()
    }
}
