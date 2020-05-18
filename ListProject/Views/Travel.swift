//
//  Expence.swift
//  ListProject
//
//  Created by Nada Alm on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
//
//struct Expence{
//    var name: String
//    var cost: String
//}


struct TravelStruct {
    
   //
    var Picture : Image
    var Name : String
    var Budget : String
    var Remainig : String
    var Spend : [spendMoney]
    var Others : [others]
    var befotrtraveling : [BeforeTraveling]
    var aftertraveling : [AfterTraveling]
}

struct spendMoney : Hashable, Identifiable{
    var SpendName : String
    var SpendPrice : String = ""
    var id = UUID()
}
struct others : Hashable, Identifiable{
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
    var AfterName : String
    var AfterPrice : String = ""
    var id = UUID()
}

var arrayOfTravels : [TravelStruct] = []
var arrayOfBefore : [BeforeTraveling] = []
var arrayOfAfter : [AfterTraveling] = []
var arrayOfSpend : [spendMoney] = []
var arrayOfOthers : [others] = []

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

//var expences: [Expence] = [Expence(name: "Shopping", cost: "00"),Expence(name: "Transport", cost: "00"),Expence(name: "Resturants", cost: "00"),Expence(name: "Hotel", cost: "00")]
