//
//  Temp2.swift
//  ListProject
//
//  Created by Shaimaa on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct Temp2: View {
    @State var name : String = ""
    var body: some View {
        Text(name)
    }
}

struct Temp2_Previews: PreviewProvider {
    static var previews: some View {
        Temp2()
    }
}
