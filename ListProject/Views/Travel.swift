//
//  Expence.swift
//  ListProject
//
//  Created by Nada Alm on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import Foundation
//
//struct Expence{
//    var name: String
//    var cost: String
//}


struct TravelStruct {
    var Picture : String
    var Name : String
    var Budget : String
    var Remainig : String
    var Spend : String
    var Others : String
}


var arrayOfCel : [TravelStruct] = []

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

//var expences: [Expence] = [Expence(name: "Shopping", cost: "00"),Expence(name: "Transport", cost: "00"),Expence(name: "Resturants", cost: "00"),Expence(name: "Hotel", cost: "00")]
