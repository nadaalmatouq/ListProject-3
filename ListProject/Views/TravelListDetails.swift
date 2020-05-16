//
//  TravelListDetails.swift
//  ListProject
//
//  Created by Nada Alm on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI


struct TravelListDetails: View {
    @State var expence: Expence
    @State var listName: String = "Travel List"
    var body: some View {
        ZStack{
            Color(.white)
            //Image("Travel List").resizable().opacity(0.7)
           
            
            
            RoundedRectangle(cornerRadius: 40).foregroundColor(Color("Background")).offset(y:200)
           
            
            
            VStack{
            
                Text(listName).foregroundColor(Color.black).font(.system(size: 30, weight: .bold, design: .rounded)).padding(.vertical,20)
            
                Text("Remainig balance").offset(x:-90).padding(.bottom,10)
                
                Text("$1,400.50").foregroundColor(Color.black).font(.system(size: 30, weight: .bold, design: .serif)).offset(x:-90)
              
                
                HStack{
               Text("of Total ")
                Text("$5,000.00").font(.system(size: 18, weight: .bold))
                    
                }.offset(x:-75)
                
                
            }.offset(y:-220)//VStack
            
            VStack(spacing: 30){
            
                addExpense(expense: expences[0])//HStack
                addExpense(expense: expences[1])
                addExpense(expense: expences[2])
                addExpense(expense: expences[3])
                
                //use textfield
            }//VStack
            
            
            
            
        }.edgesIgnoringSafeArea(.all)
        
        
    }
}


struct addExpense: View {
  var expense: Expence

    var body: some View {
        HStack{
            Text(expense.name).font(.system(size: 25))
            Spacer()
            Text("-$").font(.system(size: 25,weight: .bold))
            Text(String(Int(expense.cost))).font(.system(size: 25,weight: .bold))
            
        }.padding(.horizontal,30)
    }
}

struct TravelListDetails_Previews: PreviewProvider {
    static var previews: some View {
        TravelListDetails(expence: expences[0])
    }
}
