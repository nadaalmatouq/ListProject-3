//
//  PartyList.swift
//  ListProject
//
//  Created by shaikha alqhtane on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct PartyList: View {
    @State var Budget :String=""
    @State var Clothes :String=""
    @State var Shoes :String=""
    @State var Remaining:String="0"
    
    func calculateRamingandUpdateView(){
        let Budget = Double(self.Budget)!
        let Clothes = Double(self.Clothes)!
        let Shoes = Double(self.Shoes)!
        let Remaining = calculateRamining(Budget: Budget, Clothes: Clothes , Shoes: Shoes)
        self.Remaining = String(format:"%.2f",Remaining)
       
    }
   func calculateRamining(Budget:Double,Clothes:Double,Shoes:Double) -> Double{
          return Budget-(Clothes+Shoes)
      }
      
    var body: some View {
        ZStack{
            Color("Background")
                .edgesIgnoringSafeArea(.all)
                 RoundedRectangle(cornerRadius: 50)
               .foregroundColor(Color("blue button"))
               .offset(y:170)
            VStack{
                Text("My Shopping List")
                    .foregroundColor(.pink)
                    .shadow(radius: 7)
                    .font(.system(size:30,weight:.regular,design:.rounded))
            }.offset(y:-300)
    
            VStack{
                HStack{
                Text("Budget :")
                .foregroundColor(.pink)
                .shadow(radius: 7)
                .font(.system(size:20,weight:.regular,design:.rounded))
                .padding(.vertical,10)
                TextField(" Enter your budget ",text:$Budget)
                .frame(width: 200, height: 20, alignment: .leading)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack{
                Text("Clothes :")
                .foregroundColor(.pink)
                .shadow(radius: 7)
                .font(.system(size:20,weight:.regular,design:.rounded))
                .padding(.vertical,10)
                 TextField(" ...  ",text:$Clothes)
                 .frame(width: 200, height: 20, alignment: .leading)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack{
                Text("Shoes :")
                .foregroundColor(.pink)
                .shadow(radius: 7)
                .font(.system(size:20,weight:.regular,design:.rounded))
                    .padding(.vertical,10)
               TextField("...   ",text:$Shoes)
                .frame(width: 200, height: 20, alignment: .leading)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                }.offset(x:5)

            }.offset(x:5,y:-10)
            VStack{
                Button(action: {
                    self.calculateRamingandUpdateView()
                }){
                    VStack{
                    Text("Calculate")
                            .foregroundColor(.pink)
                            .padding(.vertical,10)
                            .padding(.horizontal,30)
                            .font(.system(size:30))
                            .background(Color.white)
                           .cornerRadius(90)
                           .shadow(radius: 5)
                        .offset(x:5,y:150)
                        HStack{
                         Text(" Remaining :")
                         .foregroundColor(.pink)
                         .shadow(radius: 7)
                         .font(.system(size:20,weight:.regular,design:.rounded))
                             .padding(.vertical,10)
                        TextField("    ",text:$Shoes)
                         .frame(width: 200, height: 20, alignment: .leading)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.offset(y:170)
                        
                    }.offset(y:30)
                    
                }
            }
            
            
        }
            
            
            }
            
        }
    


struct PartyList_Previews: PreviewProvider {
    static var previews: some View {
        PartyList()
    }
}
