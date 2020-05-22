//
//  Env.swift
//  ListProject
//
//  Created by Nada Alm on 5/15/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

class Env: ObservableObject{

    @Published var lists: [Lista] = [Lista(givenName: "", budget: "", id: UUID(), type: .travel, remaining: "")]
    @Published var currentListType: Type = .travel

    @Published var types: [Type] = [.travel,.celebration,.shopping]
    @Published var currentLista : Lista = Lista(givenName: "", budget: "", id: UUID(), type: .travel, remaining: "")
    
     // @Published var willMoveToNextScreen = false
    
    @Published var itsatravelList: Bool = false   //DONT FORGET TO TOGGLE IT
    @Published var itsaCelebrationList: Bool = false
    @Published var itsaShoppingList: Bool = false 
    //SEE HOW WE CAN INITIALIZE 
    
    //@Published var currentTravelList : TravelList = TravelList(lista: Lista(givenName: "", budget: "", id: UUID(), type: .travel, remaining: ""), id: UUID(), spendMoney: [SpendMoney(spendName: "", spendPrice: "", id: UUID())], others: [Others(otherName: "", otherPrice: "", id: UUID())], beforetraveling: [BeforeTraveling(beforeName: "", beforePrice: "", id: UUID())], aftertraveling: [AfterTraveling(afterName: "", afterPrice: "", id: UUID())])
    @Published var currentTravelList : TravelList = TravelList( lista: Lista(givenName: "", budget: "", id: UUID(), type: .travel, remaining: ""), picture: Image(systemName: "camera.circle") , id: UUID(), spendMoney: [], others: [], beforetraveling: [], aftertraveling: [])
   
    
    //@Published var alltravelLists : [TravelList] = [TravelList(lista: Lista(givenName: "Bali", budget: "", id: UUID(), type: .travel, remaining: ""), id: UUID(), spendMoney: [SpendMoney(spendName: "", spendPrice: "", id: UUID())], others: [Others(otherName: "", otherPrice: "", id: UUID())], beforetraveling: [BeforeTraveling(beforeName: "", beforePrice: "", id: UUID())], aftertraveling: [AfterTraveling(afterName: "", afterPrice: "", id: UUID())])]
    
       @Published var alltravelLists : [TravelList] = []
    
    
   
    //@Published var currentCelebrationList : CelebrationList = CelebrationList(
    //    lista: Lista(givenName: "", budget: "", id: UUID(), type: .celebration, remaining: ""), id: UUID()
    //    , gifts: [GiftsList(name: "", price: "", id: UUID())]
    //    , decoration: [DecorationList(name: "", price: "", id: UUID())]
    //    , clothesAccessories: [ClothesList(name: "", price: "", id: UUID())]
    //    , other: [OtherList(name: "", price: "", id: UUID()) ])
    
    @Published var currentCelebrationList : CelebrationList = CelebrationList(
    lista: Lista(givenName: "", budget: "", id: UUID(), type: .celebration, remaining: ""), id: UUID()
    , gifts: []
    , decoration: []
    , clothesAccessories: []
    , other: [])
   
  //@Published var allCelebrationLists : [CelebrationList] = [CelebrationList(
  //   lista: Lista(givenName: "Baby Shower", budget: "", id: UUID(), type: .celebration, remaining: "")
  //    , gifts: [GiftsList(name: "", price: "", id: UUID())]
  //    , decoration: [DecorationList(name: "", price: "", id: UUID())]
  //    , clothesAccessories: [ClothesList(name: "", price: "", id: UUID())]
  //    , other: [OtherList(name: "", price: "", id: UUID()) ])]
    
    @Published var allCelebrationLists : [CelebrationList] = []
    
    
    //@Published var currentShoppingList : ShoppingList = ShoppingList(lista: Lista(givenName: "testShop", budget: "50", id: UUID(), type: .shopping, remaining: ""), id: UUID(), listClothesAccessories: [AccessorisStruct(clothName: "t1", clothPrice: "12")], listFoodVegetables: [foodStruct(foName: "t2", foPrice: "")], listElectronicDevices: [electronicStruct(eleName: "t3", elePrice: "")], listOthers: [othersStruct(otherName: "t4", otherPrice: "")])
       
     @Published var currentShoppingList : ShoppingList = ShoppingList(lista: Lista(givenName: "testShop", budget: "50", id: UUID(), type: .shopping, remaining: ""), id: UUID(), listClothesAccessories: [], listFoodVegetables: [], listElectronicDevices: [], listOthers: [])
 
    
    //@Published var allShoppingLists : [ShoppingList] = [ShoppingList(lista: Lista(givenName: "testShop", budget: "50", id: UUID(), type: .shopping, remaining: ""), listClothesAccessories: [AccessorisStruct(clothName: "t1", clothPrice: "")], listFoodVegetables: [foodStruct(foName: "t2", foPrice: "")], listElectronicDevices: [electronicStruct(eleName: "t3", elePrice: "")], listOthers: [othersStruct(otherName: "t4", otherPrice: "")])]
    
    
    @Published var allShoppingLists : [ShoppingList] = []
      
    
    
    
}//End class Env
