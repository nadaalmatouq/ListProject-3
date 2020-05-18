//
//  TravelListDetails.swift
//  ListProject
//
//  Created by Nada Alm on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

enum BeforeORAfter {
    case before
    case after
    
    
    func text () -> String {
        switch self {
        case .before : return"before"
        case .after : return"after"
            
        }
    }
    
}
enum whenClickeOn {
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
struct TravelListDetails: View {
    //    @State var expence: Expence
    //    @State var before = [BeforeTraveling]()
    //    @State var after = [AfterTraveling]()
    @State var listName: String = ""
    @State var NameOfTheList : String = ""
    @State var budget : String = ""
    @State var budgetRem : String = ""
    @State var name = ""
    @State var cost = ""
    @State var addItem = false
    @State var isClickSpend = false
    @State var isClickOthers = false
    @State var isClickBefore = false
    @State var isClickAfter = false
    @State var refresh = false
    @State var GoToMain = false
    @State var expenses = [Expence]()
    @State var addItemName: String = ""
    @State var addItemCost: String = ""
    @State var CurrencyFrom: String = ""
    @State var CurrencyTo: String = ""
    @State var value: String = ""
    @State var Spend: String = ""
    @State var Before: String = ""
    @State var After: String = ""
    @State var Others: String = ""
    @State var newNameSpend : String = ""
    @State var newPriceSpend : String = ""
    @State var newNameBefore : String = ""
    @State var newPriceBefore : String = ""
    @State var newNameAfter : String = ""
    @State var newPriceAfter : String = ""
    @State var newNameOthers : String = ""
    @State var newPriceOthers : String = ""
    @State var whenClickSpend = whenClickeOn.plus
    @State var whenClickBefore = whenClickeOn.plus
    @State var whenClickAfter = whenClickeOn.plus
    @State var whenClickOther = whenClickeOn.plus
    @State private var showingAlert = false
    @State var moveToMain = false
    //    @ObservedObject var taskStore = TaskStored()
    
    // the below var for list picture
    @State var imageData : Data = .init(capacity: 0)
    @State var show = false
    @State var imagePicker = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    // second new picture : from github
    @State private var image2: Image? = Image(systemName: "camera.circle")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    var body: some View {
        
        ZStack {
            
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            NavigationLink(destination: MainList(), isActive: $moveToMain){
                Text("")
            }
            
            ScrollView{
                
                VStack{
                    
                    HStack{
                        Spacer()
//                        RoundedRectangle(cornerRadius: 40).foregroundColor(Color("Background")).offset(y:200)
                        image2!
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color("blue"), lineWidth: 5))
                            .shadow(radius: 10)
                            .padding(.horizontal)
                            .onTapGesture { self.shouldPresentActionScheet = true }
                            .sheet(isPresented: $shouldPresentImagePicker) {
                                SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image2, isPresented: self.$shouldPresentImagePicker)
                        }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                            ActionSheet(title: Text("Take a photo or select from photo library"), message: Text(""), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                                self.shouldPresentImagePicker = true
                                self.shouldPresentCamera = true
                            }), ActionSheet.Button.default(Text("Photo Library"), action: {
                                self.shouldPresentImagePicker = true
                                self.shouldPresentCamera = false
                            }), ActionSheet.Button.cancel()])
                        }
                        
                        
                        
                    }
                    
                    VStack{
                        
                        VStack{
                            
                            Text(listName).foregroundColor(Color.black).font(.system(size: 30, weight: .bold, design: .rounded)).padding(.vertical,20)
                            
                            HStack{
                                Text("List Name")
                                TextField("Enter your List Name", text: $listName)
                                    .frame(width: 270, height: 30, alignment: .leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            HStack{
                                Text("Currency From: ")
                                    .offset(x:20)
                                Spacer()
                                
                                Text("Currency To: ")
                                
                                Spacer()
                                
                            }
                            HStack{
                                TextField("Enter Currency From..", text: $CurrencyFrom)
                                    .frame(width: 170, height: 30, alignment: .leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .offset(x:-10)
                                TextField("Enter Currency To..", text: $CurrencyTo)
                                    .frame(width: 170, height: 30, alignment: .leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .offset(x:10)
                            }
                            HStack{
                                Text("Currency in \(CurrencyTo) is: ")
                                Button(action: {
                                    
                                    self.Currency()
                                }) {
                                    Text(self.value)
                                    Image(systemName: "arrow.right")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color("orange button"))
                                }
                            }
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Budget")
                                        .frame(width: 90, height: 30, alignment: .leading)
                                        .offset(x:20)
                                    
                                    Text("Remaining")
                                        .frame(width: 90, height: 30, alignment: .leading)
                                        .offset(x:20)
                                    
                                }
                                
                                Spacer()
                                VStack(alignment: .leading){
                                    TextField("Enter Budget", text: $budget)
                                        .frame(width: 140, height: 30, alignment: .leading)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .offset(x:-38)
                                    Text(budgetRem)
                                        .frame(width: 140, height: 30, alignment: .leading)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                            }
                            HStack{
                                Button(action: {
                                    self.whenClickSpend.toggleClick()
                                    self.isClickSpend.toggle()
                                }){
                                    VStack{
                                        HStack{
                                            Image(systemName:whenClickSpend.textNameClick())
                                                .resizable()
                                                .frame(width: 20, height: 20, alignment: .center)
                                                .foregroundColor(Color("blue"))
                                            Text("Spend: ").modifier(blueColorForAddTitles())
                                            Spacer()
                                        }
                                    }
                                }
                            }.padding(.horizontal)
                            Group{ if self.isClickSpend {
                                VStack{
                                    Group{
                                        if arrayOfSpend.count >= 0 {
                                            ForEach(arrayOfSpend, id: \.self){ i in
                                                HStack{
                                                    Text(i.SpendName)
                                                        .modifier(blueColorForAddTitles())
                                                        .frame(width: 190, height: 30, alignment: .center)
                                                    
                                                    Spacer()
                                                    Text(i.SpendPrice)
                                                        .modifier(blueColorForAddTitles())
                                                        .frame(width: 100, height: 30, alignment: .center)
                                                        .background(Color("blue button"))
                                                }.padding(.vertical,2)
                                            }
                                            if refresh{
                                                Text(newNameSpend)
                                                    .modifier(blueColorForAddTitles())
                                            }
                                        }
                                    }.padding(.horizontal, 15)
                                    Group{
                                        HStack{
                                            TextField("Enter Items to Spend", text: self.$newNameSpend)
                                                .frame(width: 140, height: 30, alignment: .leading)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                            TextField("Enter price", text: self.$newPriceSpend)
                                                .frame(width: 140, height: 30, alignment: .leading)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                            Image(systemName: "plus")
                                                .onTapGesture {
                                                    if (self.newNameSpend == "" && self.newPriceSpend == "")
                                                    { }  // if both field empty
                                                    else if (self.newNameSpend == ""){
                                                    }  // only name empty
                                                    else{
                                                        if (self.newPriceSpend == ""){
                                                            self.newPriceSpend = "0.0"
                                                        } // only price empty will continue
                                                        self.refresh = true
                                                        arrayOfSpend.append(spendMoney(SpendName: self.newNameSpend, SpendPrice: self.newPriceSpend))
                                                        self.calculateTheRemainig(prc: self.newPriceSpend)
                                                        print(arrayOfSpend)
                                                        self.newNameSpend = ""
                                                        self.newPriceSpend = ""
                                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                        self.refresh = false
                                                    }
                                            }
                                        }
                                    }
                                }
                                }
                                HStack{
                                    Button(action: {
                                        self.whenClickBefore.toggleClick()
                                        self.isClickBefore.toggle()
                                        if self.isClickBefore {
                                            print("test open before traveling")
                                        }
                                    }){
                                        Image(systemName:whenClickBefore.textNameClick())
                                            .resizable()
                                            .frame(width: 20, height: 20, alignment: .center)
                                            .foregroundColor(Color("blue"))
                                        Text("Before Traveling").modifier(blueColorForAddTitles())
                                        Spacer()
                                    }
                                }.padding(.horizontal)
                                if self.isClickBefore {
                                    VStack{
                                        Group{
                                            if arrayOfBefore.count >= 0 {
                                                ForEach(arrayOfBefore, id: \.self){ i in
                                                    HStack{
                                                        Text(i.beforeName)
                                                            .modifier(blueColorForAddTitles())
                                                            .frame(width: 190, height: 30, alignment: .center)
                                                        
                                                        Spacer()
                                                        Text(i.beforePrice)
                                                            .modifier(blueColorForAddTitles())
                                                            .frame(width: 100, height: 30, alignment: .center)
                                                            .background(Color("blue button"))
                                                    }.padding(.vertical,2)
                                                }
                                                if refresh{
                                                    Text(newNameBefore)
                                                        .modifier(blueColorForAddTitles())
                                                }
                                            }
                                        }.padding(.horizontal, 15)
                                    }
                                    HStack{
                                        TextField("Enter item .. ", text: self.$newNameBefore)
                                            .frame(width: 140, height: 30, alignment: .leading)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                        TextField("Enter price .. ", text: self.$newPriceBefore)
                                            .frame(width: 140, height: 30, alignment: .leading)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                        Image(systemName: "plus")
                                            .onTapGesture {
                                                if (self.newNameBefore == "" && self.newPriceBefore == "")
                                                { }  // if both field empty
                                                else if (self.newNameBefore == ""){
                                                }  // only name empty
                                                else{
                                                    if (self.newPriceBefore == ""){
                                                        self.newPriceBefore = "0.0"
                                                    } // only price empty will continue
                                                    self.refresh = true
                                                    arrayOfBefore.append(BeforeTraveling(beforeName: self.newNameBefore, beforePrice: self.newPriceBefore))
                                                    self.calculateTheRemainig(prc: self.newPriceBefore)
                                                    print(arrayOfBefore)
                                                    self.newNameBefore = ""
                                                    self.newPriceBefore = ""
                                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                    self.refresh = false
                                                }
                                        }
                                    }
                                }
                            }
                            Spacer()
                            Group{
                                HStack{
                                    Button(action: {
                                        self.whenClickAfter.toggleClick()
                                        self.isClickAfter.toggle()
                                    }){
                                        Image(systemName:whenClickAfter.textNameClick())
                                            .resizable()
                                            .frame(width: 20, height: 20, alignment: .center)
                                            .foregroundColor(Color.black)
                                        Text("After Traveling.. ").modifier(blueColorForAddTitles())
                                        Spacer()
                                    }
                                }.padding(.horizontal)
                                if self.isClickAfter{
                                    VStack{
                                        Group{
                                            if arrayOfAfter.count >= 0 {
                                                ForEach(arrayOfAfter, id: \.self){ i in
                                                    HStack{
                                                        Text(i.AfterName)
                                                            .modifier(blueColorForAddTitles())
                                                            .frame(width: 190, height: 30, alignment: .center)
                                                        
                                                        Spacer()
                                                        Text(i.AfterPrice)
                                                            .modifier(blueColorForAddTitles())
                                                            .frame(width: 100, height: 30, alignment: .center)
                                                            .background(Color("blue button"))
                                                    }.padding(.vertical,2)
                                                }
                                                if refresh{
                                                    Text(newNameAfter)
                                                        .modifier(blueColorForAddTitles())
                                                }
                                            }
                                        }.padding(.horizontal, 15)
                                        HStack{
                                            TextField("Enter Item..", text: self.$newNameAfter)
                                                .frame(width: 140, height: 30, alignment: .leading)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                            TextField("Enter price..", text: self.$newPriceAfter)
                                                .frame(width: 140, height: 30, alignment: .leading)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                            Image(systemName: "plus")
                                                .onTapGesture {
                                                    if (self.newNameAfter == "" && self.newPriceAfter == "")
                                                    { }  // if both field empty
                                                    else if (self.newNameAfter == ""){
                                                    }  // only name empty
                                                    else{
                                                        if (self.newPriceAfter == ""){
                                                            self.newPriceAfter = "0.0"
                                                        } // only price empty will continue
                                                        self.refresh = true
                                                        arrayOfAfter.append(AfterTraveling(AfterName: self.newNameAfter, AfterPrice: self.newNameAfter))
                                                        self.calculateTheRemainig(prc: self.newPriceAfter)
                                                        print(arrayOfAfter)
                                                        self.newNameAfter = ""
                                                        self.newPriceAfter = ""
                                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                        self.refresh = false
                                                    }
                                            }
                                        }
                                    }
                                }
                                Group{
                                    HStack{
                                        Button(action: {
                                            self.whenClickOther.toggleClick()
                                            self.isClickOthers.toggle()
                                        }){
                                            Image(systemName:whenClickOther.textNameClick())
                                                .resizable()
                                                .frame(width: 20, height: 20, alignment: .center)
                                                .foregroundColor(Color.black)
                                            Text("Others.. ").modifier(blueColorForAddTitles())
                                            Spacer()
                                        }
                                    }.padding(.horizontal)
                                    if self.isClickOthers{
                                        VStack{
                                            Group{
                                                if arrayOfOthers.count >= 0 {
                                                    ForEach(arrayOfOthers, id: \.self){ i in
                                                        HStack{
                                                            Text(i.otherName)
                                                                .modifier(blueColorForAddTitles())
                                                                .frame(width: 190, height: 30, alignment: .center)
                                                            
                                                            Spacer()
                                                            Text(i.otherPrice)
                                                                .modifier(blueColorForAddTitles())
                                                                .frame(width: 100, height: 30, alignment: .center)
                                                                .background(Color("blue button"))
                                                        }.padding(.vertical,2)
                                                    }
                                                    if refresh{
                                                        Text(newNameOthers)
                                                            .modifier(blueColorForAddTitles())
                                                    }
                                                }
                                            }.padding(.horizontal, 15)
                                            HStack{
                                                TextField("Enter Others", text: self.$newNameOthers)
                                                    .frame(width: 140, height: 30, alignment: .leading)
                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                                TextField("Enter price", text: self.$newPriceOthers)
                                                    .frame(width: 140, height: 30, alignment: .leading)
                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                                Image(systemName: "plus")
                                                    .onTapGesture {
                                                        if (self.newNameOthers == "" && self.newPriceOthers == "")
                                                        { }  // if both field empty
                                                        else if (self.newNameOthers == ""){
                                                        }  // only name empty
                                                        else{
                                                            if (self.newPriceOthers == ""){
                                                                self.newPriceOthers = "0.0"
                                                            } // only price empty will continue
                                                            self.refresh = true
                                                            arrayOfOthers.append(others(otherName: self.newNameOthers, otherPrice: self.newPriceOthers))
                                                            self.calculateTheRemainig(prc: self.newPriceOthers)
                                                            print(arrayOfOthers)
                                                            self.newNameOthers = ""
                                                            self.newPriceOthers = ""
                                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                            self.refresh = false
                                                        }
                                                }
                                            }
                                        }
                                    }
                                    
                                    
                                    Spacer()
                                    
                                    Group{
                                        HStack{
                                            Button(action: {
                                                //                            let newTravel = TravelStruct(Picture: self.image2!, Name: self.name, Budget: self.budget, Remainig: self.budgetRem, Spend: arrayOfSpend, Others: arrayOfOthers, befotrtraveling: arrayOfBefore)
                                                //                        arrayOfTravels.append(newTravel)
                                                //                        print(arrayOfTravels)
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
                                                print(arrayOfTravels)
                                            })
                                            {
                                                Text("Share")
                                                    .fontWeight(.semibold)
                                                    .font(.custom("Georgia Regular", size: 25))
                                                    .padding(.horizontal, 40)
                                                    .padding(.vertical, 8)
                                                    .foregroundColor(Color("blue"))
                                                    .background(Color("blue button"))
                                                    .cornerRadius(20)
                                            }
                                        }.padding()
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
            
            
        }}
    
    
    func calculateTheRemainig(prc : String) {
        var theRemain : Double = 0.0
        var theNewPrice : Double = 0.0
        theNewPrice = Double(prc) ?? 0.0
        if (self.budget != "" && self.budgetRem == ""){
            self.budgetRem = self.budget
            theRemain = Double(self.budgetRem) ?? 0.0
            self.budgetRem = String(theRemain-theNewPrice)
            print(theNewPrice)
        }
        else if (self.budget != "" && self.budgetRem != ""){
            theRemain = Double(self.budgetRem) ?? 0.0
            self.budgetRem = String(theRemain-theNewPrice)
            print(theNewPrice)
            print(self.budgetRem)
        }
    }
    
    func Currency(){
        let budget = Double(self.budget) ?? 0.0
        if ((CurrencyFrom == "KWD") || (CurrencyFrom == "Dinar") || (CurrencyFrom == "kwd") || (CurrencyFrom == "dinar")) && (CurrencyTo == "USD") || ((CurrencyTo == "Usd") || (CurrencyTo == "dollar") || (CurrencyTo == "Dollar") || (CurrencyTo == "$")){
            let budget = budget / 0.1983
            self.value = String (format: "$ %.2f", budget)
        }
        else if ((CurrencyFrom == "KWD") || (CurrencyFrom == "Dinar") || (CurrencyFrom == "kwd") || (CurrencyFrom == "dinar")) && ((CurrencyTo == "EUR") || (CurrencyTo == "EURO") || (CurrencyTo == "euro") || (CurrencyTo == "eur") || (CurrencyTo == "Euro") || (CurrencyTo == "€")){
            let budget = budget / 0.335
            self.value = String (format: "€ %.2f", budget)
        }
        else if ((CurrencyFrom == "KWD") || (CurrencyFrom == "Dinar") || (CurrencyFrom == "kwd") || (CurrencyFrom == "dinar")) && ((CurrencyTo == "pound") || (CurrencyTo == "POUND") || (CurrencyTo == "Pound") || (CurrencyTo == "£")){
            let budget = budget / 0.376
            self.value = String (format: "£ %.2f", budget)
        }
            
        else if ((CurrencyFrom == "KWD") || (CurrencyFrom == "Dinar") || (CurrencyFrom == "kwd") || (CurrencyFrom == "dinar")) && ((CurrencyTo == "AUD") || (CurrencyTo == "australian dollar") || (CurrencyTo == "Australian Dollar") || (CurrencyTo == "A$")){
            let budget = budget / 0.2001
            self.value = String (format: "$ %.2f", budget)
        }
            
        else if ((CurrencyFrom == "KWD") || (CurrencyFrom == "Dinar") || (CurrencyFrom == "kwd") || (CurrencyFrom == "dinar")) && ((CurrencyTo == "UAE") || (CurrencyTo == "United Arab Emirates dirham") || (CurrencyTo == "dirham") || (CurrencyTo == "Dirham")){
            let budget = budget / 0.0841
            self.value = String (format: "Dirham %.2f", budget)
        }
        else if ((CurrencyFrom == "KWD") || (CurrencyFrom == "Kwd") || (CurrencyFrom == "Dinar") || (CurrencyFrom == "kwd") || (CurrencyFrom == "dinar")) && ((CurrencyTo == "SAR") || (CurrencyTo == " Saudi Arabian Riyal") || (CurrencyTo == "Saudi riyal") || (CurrencyTo == "SR") || (CurrencyTo == "Sr")){
            let budget = budget / 0.08246
            self.value = String (format: "SR %.2f", budget)
        }
        else{
            self.value = String (format: "The currency is not available")
        }
        
        
        
    }
}

// the struct bellow for modifier with blue
//struct blueColorForAddTitles: ViewModifier {
//func body(content: Content) -> some View {
//content
//.font(.custom("Georgia Regular", size: 20))
//.foregroundColor(Color("blue"))
//}
//}

struct TravelListDetails_Previews: PreviewProvider {
    static var previews: some View {
        TravelListDetails()
    }
}

