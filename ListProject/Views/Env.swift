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
    
      @Published var willMoveToNextScreen = false
    
    
      //  var arrayOfBefore : [BeforeTraveling] = []
      //  var arrayOfAfter : [AfterTraveling] = []
      //  var arrayOfSpend : [SpendMoney] = []
      //  var arrayOfOthers : [others] = []
       
    
    @Published var currentTravelList : TravelList = TravelList(lista: Lista(givenName: "", budget: "", id: UUID(), type: .travel), spendMoney: [SpendMoney(spendName: "", spendPrice: "", id: UUID())], others: [Others(otherName: "", otherPrice: "", id: UUID())], befotrtraveling: [BeforeTraveling(beforeName: "", beforePrice: "", id: UUID())], aftertraveling: [AfterTraveling(afterName: "", afterPrice: "", id: UUID())])
    
    @Published var alltravelLists : [TravelList] = [TravelList(lista: Lista(givenName: "H", budget: "", id: UUID(), type: .travel), spendMoney: [SpendMoney(spendName: "", spendPrice: "", id: UUID())], others: [Others(otherName: "", otherPrice: "", id: UUID())], befotrtraveling: [BeforeTraveling(beforeName: "", beforePrice: "", id: UUID())], aftertraveling: [AfterTraveling(afterName: "", afterPrice: "", id: UUID())])]
    
   
   // @Published var currentCelebrationList : CelebrationList = CelebrationList(lista: Lista(givenName: "", budget: "", id: UUID(), type: .travel), spendMoney: [SpendMoney(spendName: "", spendPrice: "", id: UUID())],
   //  remainig : "", gifts : giftsStruct(giftName: "", giftPrice: "",id: UUID())
   // , decoration : decorationStruct(decorationName: "", decorationPrice: "", id = UUID())
   // , clothesAccessories : clothesStruct(clothName: "", clothPrice: "",id = UUID())
   // , other : otherStruct(otherName : "", otherPrice : String = "", id = UUID())
   //

    
    
}//End class Env
