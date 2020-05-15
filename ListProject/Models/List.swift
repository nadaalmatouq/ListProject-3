//
//  List.swift
//  ListProject
//
//  Created by Alyaa AlOstad on 5/15/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import Foundation
import SwiftUI

//var GroceryArray : [String] = [""]

struct OverallList: Hashable, Identifiable {
    var MainName: String
    var DetailName: [String]
//    var DetailImage : [UIImage]
    var id = UUID()
    
}

var Grocery = OverallList(MainName: "Grocery List", DetailName: ["Sunday's Grocery", "Mom's Grocery"])
var Celebration = OverallList(MainName: "Celebrations List", DetailName: ["Fatma's Graduation"])
var Travel = OverallList(MainName: "Travel List", DetailName: ["Canada", "Rome"])

var TotalList = [Grocery, Celebration, Travel]
//    func addGrocery( value: String )
//    {
//        var v1 = GroceryArray.append(value)
//        var newlist = Mainlist(MainName: "Grocery List", DetailName: v1)
//

//    }
//    func addTravel( value: String ){
//
//    let newlist = Mainlist(MainName: "Travel List", DetailName: [value])
//
//    }
//
//    func addShopping( value: String ){
//
//    let newlist = Mainlist(MainName: "Shopping List", DetailName: [value])
//
//}
//}


