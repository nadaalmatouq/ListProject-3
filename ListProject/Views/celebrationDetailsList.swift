//
//  celebrationDetailsList.swift
//  ListProject
//
//  Created by Shaimaa on 5/17/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct CelebrationList {
    
      
    var lista : Lista
    
    var remainig : String
    var gifts : [giftsStruct]
    var decoration : [decorationStruct]
    var clothesAccessories : [clothesStruct]
    var other : [otherStruct]
}

struct giftsStruct : Hashable, Identifiable{
    var giftName : String
    var giftPrice : String = ""
    var id = UUID()
}

struct decorationStruct : Hashable, Identifiable{
    var decorationName : String
    var decorationPrice : String = ""
    var id = UUID()
}

struct clothesStruct : Hashable, Identifiable{
    var clothName : String
    var clothPrice : String = ""
    var id = UUID()
}

struct otherStruct : Hashable, Identifiable{
    var otherName : String
    var otherPrice : String = ""
    var id = UUID()
}

var arrayOfCel13 : [CelebrationList] = []
var arrayOfGifts : [giftsStruct] = []
var arrayOfDecoration : [decorationStruct] = []
var arrayOfClothes : [clothesStruct] = []
var arrayOfOther : [otherStruct] = []

enum whenClick13 {
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

struct celebrationDetailsList: View {
    
    
    @EnvironmentObject var env: Env
    
    @State var listName : String = ""
    @State var budgetMon : String = ""
    @State var budgetRem : String = ""
    @State var whenClickGift = whenClick13.plus
    @State var whenClickDecoration = whenClick13.plus
    @State var whenClickClothes = whenClick13.plus
    @State var whenClickOther = whenClick13.plus
    @State var isClickGift = false
    @State var isClickDecoration = false
    @State var isClickClothes = false
    @State var isClickOther = false
    @State var listGift : String = ""
    @State var listDec : String = ""
    @State var listCAndA : String = ""
    @State var listOther : String = ""
    @State var newNameGift : String = ""
    @State var newPriceGifts : String = ""
    @State var newNameDec : String = ""
    @State var newPriceDec : String = ""
    @State var newNameCloth : String = ""
    @State var newPriceCloth : String = ""
    @State var newNameOth : String = ""
    @State var newPriceOth : String = ""
    @State var refreshNow = false
    @State var moveToMain = false
    @State private var showingAlert = false  // alert for save button
    // the below var for list picture
    @State var imageData : Data = .init(capacity: 0)
    @State var show = false
    @State var imagePicker = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    // second new picture : from github
    @State private var image1: Image? = Image(systemName: "camera.circle")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
    var body: some View {
   
            ZStack{
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                NavigationLink(destination: MainList(), isActive: $moveToMain){
                    Text("")
                }
                ScrollView{
                    VStack{
                        // the bellow z,v,hstack for list picture
                        //                ZStack{
                        HStack{
                            Spacer()
                            image1!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color("blue"), lineWidth: 5))
                                .shadow(radius: 10)
                                .padding(.horizontal)
                                .onTapGesture { self.shouldPresentActionScheet = true }
                                .sheet(isPresented: $shouldPresentImagePicker) {
                                    SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image1, isPresented: self.$shouldPresentImagePicker)
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
                                Spacer()
                                Text("Celebration List")
                                    .font(.largeTitle)
                                    .modifier(blueColorForAddTitles())
                                    .padding(.bottom, 30)
                                HStack{
                                    Text("List Name")
                                        .modifier(blueColorForAddTitles())
                                    TextField("Enter your List Name", text: $listName)
                                        .frame(width: 240, height: 30, alignment: .leading)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                                HStack{
                                    VStack(alignment: .leading, spacing:7){
                                        
                                        Text("Budget")
                                            .modifier(blueColorForAddTitles())
                                            .frame(width: 100, height: 30, alignment: .leading)
                                        
                                        Text("Remaining")
                                            .modifier(blueColorForAddTitles())
                                            .frame(width: 100, height: 30, alignment: .leading)
                                    }
                                    Spacer()
                                    VStack(alignment: .leading, spacing:7){
                                        TextField("Enter Budget", text: $budgetMon)
                                            .keyboardType(.decimalPad)
                                            .frame(width: 140, height: 30, alignment: .leading)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                        Text(self.budgetRem)
                                            .frame(width: 140, height: 30, alignment: .leading)
                                        // .background(Color.white)
                                    }
                                }.padding(.horizontal)
                                    .padding(.vertical)
                                HStack{
                                    Button(action: {
                                        self.whenClickGift.toggleClick()
                                        self.isClickGift.toggle()
                                    }){
                                        VStack{
                                            HStack{
                                                Image(systemName:whenClickGift.textNameClick())
                                                    .resizable()
                                                    .frame(width: 20, height: 20, alignment: .center)
                                                    .foregroundColor(Color("blue"))
                                                Text("Gifts").modifier(blueColorForAddTitles())
                                                Spacer()
                                            }
                                        }
                                    }
                                }.padding(.horizontal)
                                if self.isClickGift {
                                    VStack{
                                        Group{
                                            if arrayOfGifts.count >= 0 {
                                                ForEach(arrayOfGifts, id: \.self){ i in
                                                    HStack{
                                                        Text(i.giftName)
                                                            .modifier(blueColorForAddTitles())
                                                            .frame(width: 190, height: 30, alignment: .center)
                                                        
                                                        Spacer()
                                                        Text(i.giftPrice)
                                                            .modifier(blueColorForAddTitles())
                                                            .frame(width: 100, height: 30, alignment: .center)
                                                            .background(Color("blue button"))
                                                    }.padding(.vertical,2)
                                                }
                                                if refreshNow{
                                                    Text(newNameGift)
                                                        .modifier(blueColorForAddTitles())
                                                }
                                            }
                                        }.padding(.horizontal, 15)
                                        HStack{
                                            TextField("Enter gift", text: self.$newNameGift)
                                                .frame(width: 140, height: 30, alignment: .leading)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                            TextField("Enter price", text: self.$newPriceGifts)
                                                .frame(width: 140, height: 30, alignment: .leading)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                            Image(systemName: "plus")
                                                .onTapGesture {
                                                    if (self.newNameGift == "" && self.newPriceGifts == "")
                                                    { }  // if both field empty
                                                    else if (self.newNameGift == ""){
                                                    }  // only name empty
                                                    else{
                                                        if (self.newPriceGifts == ""){
                                                            self.newPriceGifts = "0.0"
                                                        } // only price empty will continue
                                                        self.refreshNow = true
                                                        arrayOfGifts.append(giftsStruct(giftName: self.newNameGift, giftPrice: self.newPriceGifts))
                                                        self.calculateTheRemainig(prc: self.newPriceGifts)
                                                        print(arrayOfGifts)
                                                        self.newNameGift = ""
                                                        self.newPriceGifts = ""
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
                                            self.whenClickDecoration.toggleClick()
                                            self.isClickDecoration.toggle()
                                            if self.isClickDecoration {
                                                print("test open decoration")
                                            }
                                        }){
                                            Image(systemName:whenClickDecoration.textNameClick())
                                                .resizable()
                                                .frame(width: 20, height: 20, alignment: .center)
                                                .foregroundColor(Color("blue"))
                                            Text("Home Decorations").modifier(blueColorForAddTitles())
                                            Spacer()
                                        }
                                    }.padding(.horizontal)
                                    if self.isClickDecoration {
                                        VStack{
                                            Group{
                                                if arrayOfDecoration.count >= 0 {
                                                    ForEach(arrayOfDecoration, id: \.self){ i in
                                                        HStack{
                                                            Text(i.decorationName)
                                                                .modifier(blueColorForAddTitles())
                                                                .frame(width: 190, height: 30, alignment: .center)
                                                            
                                                            Spacer()
                                                            Text(i.decorationPrice)
                                                                .modifier(blueColorForAddTitles())
                                                                .frame(width: 100, height: 30, alignment: .center)
                                                                .background(Color("blue button"))
                                                        }.padding(.vertical,2)
                                                    }
                                                    if refreshNow{
                                                        Text(newNameDec)
                                                            .modifier(blueColorForAddTitles())
                                                    }
                                                }
                                            }.padding(.horizontal, 15)
                                            HStack{
                                                TextField("Enter decoration", text: self.$newNameDec)
                                                    .frame(width: 140, height: 30, alignment: .leading)
                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                                TextField("Enter price", text: self.$newPriceDec)
                                                    .frame(width: 140, height: 30, alignment: .leading)
                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                                Image(systemName: "plus")
                                                    .onTapGesture {
                                                        if (self.newNameDec == "" && self.newPriceDec == "")
                                                        { }  // if both field empty
                                                        else if (self.newNameDec == ""){
                                                        }  // only name empty
                                                        else{
                                                            if (self.newPriceDec == ""){
                                                                self.newPriceDec = "0.0"
                                                            } // only price empty will continue
                                                            self.refreshNow = true
                                                            arrayOfDecoration.append(decorationStruct(decorationName: self.newNameDec, decorationPrice: self.newPriceDec))
                                                            self.calculateTheRemainig(prc: self.newPriceDec)
                                                            print(arrayOfDecoration)
                                                            self.newNameDec = ""
                                                            self.newPriceDec = ""
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
                                            self.whenClickClothes.toggleClick()
                                            self.isClickClothes.toggle()
                                            if self.isClickClothes {
                                                print("test open clothes")
                                            }
                                        }){
                                            Image(systemName:whenClickClothes.textNameClick())
                                                .resizable()
                                                .frame(width: 20, height: 20, alignment: .center)
                                                .foregroundColor(Color("blue"))
                                            Text("Clothes & Accessories").modifier(blueColorForAddTitles())
                                            Spacer()
                                        }
                                    }.padding(.horizontal)
                                    if self.isClickClothes {
                                        VStack{
                                            Group{
                                                if arrayOfClothes.count >= 0 {
                                                    ForEach(arrayOfClothes, id: \.self){ i in
                                                        HStack{
                                                            Text(i.clothName)
                                                                .modifier(blueColorForAddTitles())
                                                                .frame(width: 190, height: 30, alignment: .center)
                                                            
                                                            Spacer()
                                                            Text(i.clothPrice)
                                                                .modifier(blueColorForAddTitles())
                                                                .frame(width: 100, height: 30, alignment: .center)
                                                                .background(Color("blue button"))
                                                        }.padding(.vertical,2)
                                                    }
                                                    if refreshNow{
                                                        Text(newNameCloth)
                                                            .modifier(blueColorForAddTitles())
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
                                                        { }  // if both field empty
                                                        else if (self.newNameCloth == ""){
                                                        }  // only name empty
                                                        else{
                                                            if (self.newPriceCloth == ""){
                                                                self.newPriceCloth = "0.0"
                                                            } // only price empty will continue
                                                            self.refreshNow = true
                                                            arrayOfClothes.append(clothesStruct(clothName: self.newNameCloth, clothPrice: self.newPriceCloth))
                                                            self.calculateTheRemainig(prc: self.newPriceCloth)
                                                            print(arrayOfClothes)
                                                            self.newNameCloth = ""
                                                            self.newPriceCloth = ""
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
                                            self.whenClickOther.toggleClick()
                                            self.isClickOther.toggle()
                                            if self.isClickOther {
                                                print("test open other")
                                            }
                                        }){
                                            Image(systemName:whenClickOther.textNameClick())
                                                .resizable()
                                                .frame(width: 20, height: 20, alignment: .center)
                                                .foregroundColor(Color("blue"))
                                            
                                            Text("Other").modifier(blueColorForAddTitles())
                                            Spacer()
                                        }
                                    }.padding(.horizontal)
                                    if self.isClickOther {
                                        VStack{
                                            Group{
                                                if arrayOfOther.count >= 0 {
                                                    ForEach(arrayOfOther, id: \.self){ i in
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
                                                    if refreshNow{
                                                        Text(newNameOth)
                                                            .modifier(blueColorForAddTitles())
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
                                                            arrayOfOther.append(otherStruct(otherName: self.newNameOth, otherPrice: self.newPriceOth))
                                                            self.calculateTheRemainig(prc: self.newPriceOth)
                                                            print(arrayOfOther)
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
                                             //   let newCelb = CelebrationList(listPicture: self.image1!, listName: self.lista.name, listBudget: self.budgetMon, listRemainig: self.budgetRem, listGifts: arrayOfGifts, listDecoration: arrayOfDecoration, listClothesAccessories: arrayOfClothes, listOther: arrayOfOther)
                                              //  arrayOfCel13.append(newCelb)
                                                print(arrayOfCel13)
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
        
    }
    
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
}



// the struct bellow for modifier with blue
struct blueColorForAddTitles: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Georgia Regular", size: 20))
            .foregroundColor(Color("blue"))
    }
}


// second new picture : from github

import UIKit
struct SUImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }
    
}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    init(image: Binding<Image?>, isPresented: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = Image(uiImage: image)
        }
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
}





struct celebrationDetailsList_Previews: PreviewProvider {
    static var previews: some View {
        celebrationDetailsList()
    }
}
