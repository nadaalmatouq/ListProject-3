//
//  MainListDetail.swift
//  ListProject
//
//  Created by Alyaa AlOstad on 5/15/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI


struct MainListDetail: View {
    var OverallList : OverallList
    var body: some View {
        VStack(spacing:50)
        {
            
            Text(OverallList.MainName)
                .foregroundColor(Color.black)
                .bold()
                .font(.system(size:24))
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:60){
                    ForEach(self.OverallList.DetailName, id: \.self){ (name:String) in
                        VStack{
                        Image(name)
                            .resizable()
                            .edgesIgnoringSafeArea(.all)                    .frame(width: 100, height: 100, alignment: .leading)
                        Text(name)
                            .foregroundColor(Color.black)
                    }
                    }
                
                }
            }
        }
        
    }
    
}


struct MainListDetail_Previews: PreviewProvider {
    static var previews: some View {
        MainListDetail(OverallList: Grocery)
    }
}
