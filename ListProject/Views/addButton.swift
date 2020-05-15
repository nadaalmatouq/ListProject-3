//
//  addButton.swift
//  ListProject
//
//  Created by Alyaa AlOstad on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct addButton: View {
    @State private var isActive : Bool = false
    var body: some View {
        VStack{
            Button("hello"){
                 self.isActive = true
            }
//                  Image(systemName: "plus.circle")
//                                    .foregroundColor(Color("red"))
//                                    .offset(x:-170,y:-380)
//                                    .frame(alignment: .leading)
//                                    .font(.system(size: 30))
//
        }
    }
}

struct addButton_Previews: PreviewProvider {
    static var previews: some View {
        addButton()
    }
}
