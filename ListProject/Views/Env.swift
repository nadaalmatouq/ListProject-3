//
//  Env.swift
//  ListProject
//
//  Created by Nada Alm on 5/15/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import Foundation
class Env: ObservableObject{

    @Published var lists: [Lista] = [Lista(givenName: "", budget: "", id: UUID(), type: .travel)]
    @Published var currentListType: Type = .travel

    @Published var types: [Type] = [.travel,.celebration,.shopping]
    @Published var currentLista : Lista = Lista(givenName: "", budget: "", id: UUID(), type: .travel)
    
     // @Published var willMoveToNextScreen = false
    
    @Published var itsatravelList: Bool = false   //DONT FORGET TO TOGGLE IT
    @Published var itsaCelebrationList: Bool = false
    @Published var itsaShoppingList: Bool = false 
    
    
    @Published var currentTravelList : TravelList = TravelList(lista: Lista(givenName: "", budget: "", id: UUID(), type: .travel), spendMoney: [SpendMoney(spendName: "", spendPrice: "", id: UUID())], others: [Others(otherName: "", otherPrice: "", id: UUID())], befotrtraveling: [BeforeTraveling(beforeName: "", beforePrice: "", id: UUID())], aftertraveling: [AfterTraveling(afterName: "", afterPrice: "", id: UUID())])
    
    @Published var alltravelLists : [TravelList] = [TravelList(lista: Lista(givenName: "H", budget: "", id: UUID(), type: .travel), spendMoney: [SpendMoney(spendName: "", spendPrice: "", id: UUID())], others: [Others(otherName: "", otherPrice: "", id: UUID())], befotrtraveling: [BeforeTraveling(beforeName: "", beforePrice: "", id: UUID())], aftertraveling: [AfterTraveling(afterName: "", afterPrice: "", id: UUID())])]
    
   
    @Published var currentCelebrationList : CelebrationList = CelebrationList(
        lista: Lista(givenName: "H", budget: "", id: UUID(), type: .travel)
        , gifts: [GiftsList(name: "", price: "", id: UUID())]
        , decoration: [DecorationList(name: "", price: "", id: UUID())]
        , clothesAccessories: [ClothesList(name: "", price: "", id: UUID())]
        , other: [OtherList(name: "", price: "", id: UUID()) ])
    
    
    
     @Published var allCelebrationLists : [CelebrationList] = [CelebrationList(
         lista: Lista(givenName: "H", budget: "", id: UUID(), type: .travel)
         , gifts: [GiftsList(name: "", price: "", id: UUID())]
         , decoration: [DecorationList(name: "", price: "", id: UUID())]
         , clothesAccessories: [ClothesList(name: "", price: "", id: UUID())]
         , other: [OtherList(name: "", price: "", id: UUID()) ])
     ]
    
   
    
}//End class Env
