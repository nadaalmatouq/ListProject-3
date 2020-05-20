//
//  Type.swift
//  ListProject
//
//  Created by Nada Alm on 5/19/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import Foundation
enum Type{
    case travel
    
    case celebration
    
    case shopping
    
    
    
    func name() -> String {
           switch self{
             case .travel: return "Travel List"
                   case .celebration: return "Celebration List"
           case .shopping: return "Shopping List"
             }
    }
    
    
    
}
