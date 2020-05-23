//
//  TravelListDetails.swift
//  ListProject
//
/*
1. pages are all mixed up together
2. the others append is commented in travel list, why?
3.main list names of the detail list is being repeated
4. the function in travel list struct (lhs, rhs, and hasher)
*/
//  Created by Nada Alm on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI
import Combine
import UIKit


struct TravelList : Hashable, Identifiable{


var lista : Lista
var picture : UIImage? = UIImage(systemName: "camera.circle")
var id = UUID()
var spendMoney : [SpendMoney]
var others : [Others]
var beforetraveling : [BeforeTraveling]
var aftertraveling : [AfterTraveling]

//func hash(into hasher: inout Hasher) {
//hasher.combine(id)
//}
//
//static func ==(lhs: TravelList, rhs: TravelList) -> Bool {
//return lhs.id == rhs.id
//}



// init(lista : Lista, id : UUID,
//      spendMoney : [SpendMoney], others : [Others], beforetraveling : [BeforeTraveling], aftertraveling : [AfterTraveling]) {
//
//       self.lista = lista
//       self.id = id
//       self.spendMoney = spendMoney
//       self.others = others
//       self.beforetraveling = beforetraveling
//       self.aftertraveling = aftertraveling
//
// }



}






struct SpendMoney : Hashable, Identifiable{
var spendName : String
var spendPrice : String = ""
var id = UUID()
}
struct Others : Hashable, Identifiable{
var otherName : String
var otherPrice : String = ""
var id = UUID()
}

struct BeforeTraveling: Hashable, Identifiable{
var beforeName : String
var beforePrice : String = ""
var id = UUID()
}

struct AfterTraveling: Hashable, Identifiable{
var afterName : String
var afterPrice : String = ""
var id = UUID()
}



enum whenClick {
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

enum whenTap {
case arrow
case update

mutating func toggleClick(){
switch self {
case .arrow : self = .update
case .update : self = .arrow
}
}
func textNameClick() -> String {
switch self {
case .arrow : return "arrow.right"
case .update : return "arrow.2.circlepath.circle."
}
}
}








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


@EnvironmentObject var env: Env



@State var addItem = false
@State var isClickSpend = false
@State var isClickOthers = false
@State var isClickBefore = false
@State var isClickMap = false
@State var isClickAfter = false
@State var refresh = false
@State var GoToMain = false

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
@State var whenClickMap = whenClickeOn.plus
@State var whenClickAfter = whenClickeOn.plus
@State var whenClickOther = whenClickeOn.plus
@State private var showingAlert = false
@State var moveToMain = false
@ObservedObject var netService = NetService()

// second new picture : from github
@State private var image2: UIImage? = UIImage(systemName: "camera.circle")//should be deleted ifput in env
@State private var shouldPresentImagePicker = false
@State private var shouldPresentActionScheet = false
@State private var shouldPresentCamera = false

@Binding var isEdit : Bool // this var will be passed from main list, to make the save as edit array , not new one

@Environment(\.presentationMode) var presentationMode // to dismiss the sheet after update only . only for update view : for now

@State var changeSaveToUpdate = "Save"  // this var for change save button text to update
@State var changeAlertSaveToUpdate = "Your List is saved successfully" // this var for change alert save text to update

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
//  RoundedRectangle(cornerRadius: 40).foregroundColor(Color("Background")).offset(y:200)
//    if isEdit == false{
    
        Image(uiImage: image2!)
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
      
}

.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
ActionSheet(title: Text("Take a photo or select from photo library"), message: Text(""), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
self.shouldPresentImagePicker = true
self.shouldPresentCamera = true
}), ActionSheet.Button.default(Text("Photo Library"), action: {
self.shouldPresentImagePicker = true
self.shouldPresentCamera = false
}), ActionSheet.Button.cancel()])
    }

}
//}

VStack{
 
                   
                  

VStack{


Text(env.currentTravelList.lista.givenName).foregroundColor(Color.black).font(.system(size: 30, weight: .bold, design: .rounded)).padding(.vertical,20)


//
//    HStack{
//          self.env.currentTravelList.picture
//    }
//




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
Text(env.currentTravelList.lista.budget)
.frame(width: 140, height: 30, alignment: .leading)
.offset(x:-38)
Text(self.env.currentTravelList.lista.remaining)
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
if env.currentTravelList.spendMoney.count >= 0 {
ForEach(env.currentTravelList.spendMoney, id: \.self){ i in
HStack{
Text(i.spendName)
.modifier(blueColorForAddTitles())
.frame(width: 190, height: 30, alignment: .center)

Spacer()
Text(i.spendPrice)
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
self.env.currentTravelList.spendMoney.append(SpendMoney(spendName: self.newNameSpend, spendPrice: self.newPriceSpend))
self.calculateTheRemainig(prc: self.newPriceSpend)
print(self.env.currentTravelList.spendMoney)
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
if env.currentTravelList.beforetraveling.count >= 0 {
ForEach(env.currentTravelList.beforetraveling, id: \.self){ i in
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
self.env.currentTravelList.beforetraveling.append(BeforeTraveling(beforeName: self.newNameBefore, beforePrice: self.newPriceBefore))
self.calculateTheRemainig(prc: self.newPriceBefore)
print(self.env.currentTravelList.beforetraveling)
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
if env.currentTravelList.aftertraveling.count >= 0 {
ForEach(env.currentTravelList.aftertraveling, id: \.self){ i in
HStack{
Text(i.afterName)
    .modifier(blueColorForAddTitles())
    .frame(width: 190, height: 30, alignment: .center)

Spacer()
Text(i.afterPrice)
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
self.env.currentTravelList.aftertraveling.append(AfterTraveling(afterName: self.newNameAfter, afterPrice: self.newNameAfter))
//    self.env.currentTravelList.picture = self.image2!
self.calculateTheRemainig(prc: self.newPriceAfter)
print(self.env.currentTravelList.aftertraveling)
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
Text("Others... ").modifier(blueColorForAddTitles())
Spacer()
}
}.padding(.horizontal)
if self.isClickOthers{
VStack{
Group{
if env.currentTravelList.others.count >= 0 {
ForEach(env.currentTravelList.others, id: \.self){ i in
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
//                                                                         self.env.currentTravelList.others.append(Others(otherName: self.newNameOthers, otherPrice: self.newPriceOthers))

    
    
    self.calculateTheRemainig(prc: self.newPriceOthers)
    print(self.env.currentTravelList.others)
    self.newNameOthers = ""
    self.newPriceOthers = ""
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    self.refresh = false
}
}
}
}
}
HStack{
Button(action: {
self.whenClickMap.toggleClick()
self.isClickMap.toggle()
}){
VStack{
HStack{
Image(systemName:whenClickMap.textNameClick())
.resizable()
.frame(width: 20, height: 20, alignment: .center)
.foregroundColor(Color("blue"))
Text("Search Map: ").modifier(blueColorForAddTitles())
Spacer()
}
}
}
}.padding(.horizontal)
if self.isClickMap {
VStack  {

MapView(weather: netService.weather ?? WeatherData.all())
.frame(width: UIScreen.main.bounds.width / 1.11, height: 200)
.cornerRadius(10)
.shadow(color: .secondary, radius: 10)
TextField("Please enter city name", text: $netService.city)
{ self.netService.loadWeatherInfo(by: self.netService.city)}
.font(.custom("", size: 15))
.textFieldStyle(RoundedBorderTextFieldStyle())
.shadow(color: .secondary, radius: 5)
.padding()
Spacer()
CityWeatherInfo(weather: netService.weather ?? WeatherData.all())


}

}


Spacer()

Group{
HStack{
Button(action: {
if self.isEdit {
// func edit array .. done
var theIndexHere = 0
theIndexHere = self.editArray()
self.env.currentTravelList.picture = self.image2!
print(" here in no function \(theIndexHere) end")
self.editUsingIndex(indexx: theIndexHere)
}
else {
        self.env.currentTravelList.picture = self.image2!
    
    
self.env.currentTravelList.id = UUID()
    
self.env.alltravelLists.append(self.env.currentTravelList)
print(self.env.alltravelLists)
self.moveToMain = true
}
self.showingAlert = true

})
{
Text(changeSaveToUpdate)
.fontWeight(.semibold)
.font(.custom("Georgia Regular", size: 25))
.padding(.horizontal, 40)
.padding(.vertical, 8)
.foregroundColor(Color("blue"))
.background(Color("orange button"))
.cornerRadius(20)
}
.alert(isPresented: $showingAlert) {

Alert(title: Text(changeAlertSaveToUpdate), message: Text(""), dismissButton: .default(Text("Back to main list")){
if self.isEdit {
self.presentationMode.wrappedValue.dismiss()
}
})
}
Button(action: {



print(self.env.alltravelLists)
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


}.onAppear {  // this on apper to change save button text to update
if self.isEdit{
self.changeSaveToUpdate = "Update"
self.changeAlertSaveToUpdate = "Your List is updated successfully"
    self.image2 = self.env.currentTravelList.picture
}
}
//.onDisappear(perform: {self.env.willMoveToNextScreen = false}) //so that mainList doesnt take you to this view immediatly and not passing CreateNewListView First
}

func calculateTheRemainig(prc : String) {
var theRemain : Double = 0.0
var theNewPrice : Double = 0.0
theNewPrice = Double(prc) ?? 0.0
if (self.env.currentTravelList.lista.budget != "" && self.env.currentTravelList.lista.remaining == ""){
self.env.currentTravelList.lista.remaining = self.env.currentTravelList.lista.budget
theRemain = Double(self.env.currentTravelList.lista.remaining) ?? 0.0
self.env.currentTravelList.lista.remaining = String(theRemain-theNewPrice)
print(theNewPrice)
}
else if (self.env.currentTravelList.lista.budget != "" && self.env.currentTravelList.lista.remaining != ""){
theRemain = Double(self.env.currentTravelList.lista.remaining) ?? 0.0
self.env.currentTravelList.lista.remaining = String(theRemain-theNewPrice)
print(theNewPrice)
print(self.env.currentTravelList.lista.remaining)
}
}

func Currency(){
let budget = Double(self.env.currentTravelList.lista.budget) ?? 0.0
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

func editArray() -> Int{
var theIndex : Int = 0
if let i = env.alltravelLists.firstIndex(where: { $0.lista.id == env.currentTravelList.lista.id }) {
print(" this is teeeeeest ... \(env.alltravelLists[i]) ! with index \(i) ... yes end")
theIndex = i
}
return theIndex
}

func editUsingIndex (indexx : Int) {
env.alltravelLists[indexx] = env.currentTravelList
print("test for update the array ... \(env.alltravelLists))")
}


}



//struct TravelListDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        TravelListDetails()
//    }
//}

