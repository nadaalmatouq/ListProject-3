//
//  List.swift
//  ListProject
//
//  Created by Alyaa AlOstad on 5/15/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import Foundation
import SwiftUI



struct OverallList: Hashable, Identifiable {
    var MainName: String
    var DetailName: [String]
//    var DetailImage : [UIImage]
    var id = UUID()
    
    
    
}

var Grocery = OverallList(MainName: "Grocery List", DetailName: ["Sunday's Grocery", "Mom's Grocery"])
var Celebration = OverallList(MainName: "Celebrations List", DetailName: ["Fatma's graduation"])
var Travel = OverallList(MainName: "Travel List", DetailName: ["Canada", "Rome"])

var TotalList = [Grocery, Celebration, Travel]
