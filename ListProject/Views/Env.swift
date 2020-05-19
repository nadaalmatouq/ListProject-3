//
//  Env.swift
//  ListProject
//
//  Created by Nada Alm on 5/15/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import Foundation
class Env: ObservableObject{

    @Published var lists: [Lista] = [Lista(givenName: "", budget: "", type: .travel)]
    @Published var currentListType: Type = .travel

    @Published var types: [Type] = [.travel,.celebration,.shopping]
    
    
}//End class Env
