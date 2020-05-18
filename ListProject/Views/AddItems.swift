//
//  AddItems.swift
//  ListProject
//
//  Created by Alyaa AlOstad on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

//struct Item: Hashable {
//    let name: String
//    let color: UIColor
//}

struct Expence: Hashable{
    var name: String
    var cost: String
}

struct AddItems: View {
    

    @State var expenses = [Expence]()
    @State var addItemName: String = ""
    @State var addItemCost: String = ""
    @State var addItem = false
    var beforeorafter : BeforeORAfter
    
    var body: some View {
        ZStack {
                VStack {
                    //  NavigationView {
                        List {
                            ForEach(expenses, id: \.self) { expense in
                                HStack{
                                Text(expense.name)
                                Text(expense.cost)
                                }
                            }
                        }
                        .navigationBarTitle(Text("List \(beforeorafter.text())"))
                            .navigationBarItems(trailing:
                                Button(action: {
                                    self.addItem.toggle()
                                }, label: {
                                    Image(systemName: "plus")
                                })
                                    
                        )
                    //}
                    .sheet(isPresented: $addItem) {
                        VStack {
                            HStack {
                                Text("Item Name: ")
                                TextField("Add Name", text: self.$addItemName)
                            }
                            HStack {
                                                       Text("Item Cost: ")
                                                       TextField("Add Cost", text: self.$addItemCost)
                                                   }
                    
 
                            Button(action: {
                                self.expenses.append(Expence(name: self.addItemName, cost: self.addItemCost))
                                self.addItem.toggle()
                                
                                print(self.expenses)
                                
                                // Reset Values
                                self.addItemName = ""
                                self.addItemCost = ""
                               
                            }, label: {
                                Text("Add")
                            })
                        }.padding(100)
                    }

            }
        }
    }
}

struct AddItems_Previews: PreviewProvider {
    static var previews: some View {
        AddItems(expenses: [Expence(name: "test 1", cost: "0.0")], addItem: true, beforeorafter: .after)
    }
}
