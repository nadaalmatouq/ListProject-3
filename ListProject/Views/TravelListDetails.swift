//
//  TravelListDetails.swift
//  ListProject
//
//  Created by Nada Alm on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI
import Combine

enum BeforeORAfter {
    case before
    case after
    
    
    func text () -> String {
        switch self {
        case .before : return"before"
        case .after : return"after"
            
        }
    }
    
}


struct BeforeTraveling: Hashable{
    var name: String
    var id = UUID()
}

struct AfterTraveling: Hashable{
    var name: String
    var id = UUID()
}

struct TravelListDetails: View {
    //    @State var expence: Expence
    @State var before = [BeforeTraveling]()
    @State var after = [AfterTraveling]()
    @State var listName: String = ""
    @State var NameOfTheList : String = ""
    @State var budget : String = ""
    @State var budgetRem : String = ""
    @State var name = ""
    @State var cost = ""
    @State var addItem = false
    @State var expenses = [Expence]()
    @State var addItemName: String = ""
    @State var addItemCost: String = ""
    
    @ObservedObject var taskStore = TaskStored()
    var body: some View {
        NavigationView{
            ZStack{
                
                Color(.white)
                
                HStack{
                    Spacer()
                    VStack{
                        Image(systemName:"camera")
                        Text("List Picture")
                        Spacer()
                    }.padding()
                }
                
                RoundedRectangle(cornerRadius: 40).foregroundColor(Color("Background")).offset(y:200)
                
                
                VStack{
                    
                    Text(listName).foregroundColor(Color.black).font(.system(size: 30, weight: .bold, design: .rounded)).padding(.vertical,20)
                    
                    HStack{
                        Text("List Name")
                        TextField("Enter your List Name", text: $listName)
                            .frame(width: 270, height: 30, alignment: .leading)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Budget")
                                .frame(width: 90, height: 30, alignment: .leading)
                            Text("Remaining")
                                .frame(width: 90, height: 30, alignment: .leading)
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            TextField("Enter Budget", text: $budget)
                                .frame(width: 140, height: 30, alignment: .leading)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Text(budgetRem)
                                .frame(width: 140, height: 30, alignment: .leading)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        
                        
                    }.padding(.horizontal)
                    HStack{         NavigationLink(destination: AddItems(beforeorafter: .before)){
                        Text("List Before Traveling:")
                    }.foregroundColor(.black)
                        .offset(x:-110)
                        
                        
                    }.padding(.horizontal)
                    
                    
                    VStack{  NavigationLink(destination: AddItems( beforeorafter: .after)){
                        Text("List When Traveling:")
                    }.foregroundColor(.black)
                        .offset(x:-113)

                        
                        
                        HStack{
                            Button(action: {
                                self.addItem.toggle()
                            }, label: {
                                Image(systemName: "plus.rectangle.fill")
                                    .font(.system(size: 25))
                                .foregroundColor(Color("orange button"))
                                
                            })
                            Text("Expenses: ")
                                
                                .bold()
                                .font(.title)
                        }
                        
                        
                        VStack(spacing: 10){
                            ForEach(expenses, id: \.self) { expense in
                                HStack{
                                    
                                    Text(expense.name)
                                        .padding(.leading)
                                    Spacer()
                                    Text("-$")
                                    Text(expense.cost)
                                        .padding(.trailing)
                                    
                                    
                                }
                                .font(.system(size: 20, design: .rounded))
                                    
                                .frame(width: 350, height: 50)
                                .background(Color.white)
                                .cornerRadius(20)
                                
                            }
                            
                        }
                        
                        
                        
                    }.padding(.horizontal)
                    
                }
                
                
                
                
                
                
            }.edgesIgnoringSafeArea(.all)
            
            
        }.sheet(isPresented: $addItem) {
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
                  
                    self.expenses.append(Expence(name:self.addItemName,cost:self.addItemCost))
                    self.UpdateBudget()
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
    func RemainingBudget(budget: Double, addItemCost: Double )-> Double{
        return (budget - addItemCost)
    }
    
    func UpdateBudget(){
        let budget = Double(self.budget) ?? 0
        let addItemCost = Double(self.addItemCost) ?? 0
        let Rem = RemainingBudget(budget: budget, addItemCost: addItemCost)
        self.budgetRem = String (format: "%.1f", Rem)
        
    }
    
}


struct TravelListDetails_Previews: PreviewProvider {
    static var previews: some View {
        TravelListDetails()
    }
}

