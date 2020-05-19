//
//  MainList.swift
//  ListProject
//
//
/* problems we've faced:
 
 *the image we want it to be a uiimage and not a string in our struct // hasan

 */
//
//

import SwiftUI

struct MainList: View {
    
     @EnvironmentObject var env: Env
    @State var OverallList : [OverallList] = TotalList
   
    var backgroungColor = "Background"
    @State var isWorkWillAdd = false
    @State var isWorkWillEdit = false
    @State var nameList = ""
    var body: some View {
        NavigationView{
            ZStack {
                Color(backgroungColor)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        NavigationLink(destination: CreateNewList(sheetViewStatus: false).environmentObject(self.env), isActive: $isWorkWillAdd){
                            Text("")
                        }
                        NavigationLink(destination: Temp2(name: nameList), isActive: $isWorkWillEdit){
                            Text("")
                        }
                        
                    }
           
                    List(TotalList){ OneListLoop in
                        VStack{
                            Text(OneListLoop.MainName)
                                .foregroundColor(Color.black)
                                .bold()
                                .font(.system(size:24))
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing:60){
                                    ForEach(OneListLoop.DetailName, id: \.self){ (name:String) in
                                        VStack{
                                            Image(name)
                                                .resizable()
                                                .edgesIgnoringSafeArea(.all)                    .frame(width: 100, height: 100, alignment: .leading)
                                            Text(name)
                                                .foregroundColor(Color.black)
                                            
                                        }
                                        .onTapGesture {
                                            self.isWorkWillEdit = true
                                            self.nameList = name
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .navigationBarTitle(Text("To Do List"))
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.isWorkWillAdd = true
                           
                        }) {
                            Image(systemName: "plus.circle").imageScale(.large)
                                .foregroundColor(Color("red"))
                                .font(.system(size: 25))
                        }
                    )
                }.colorMultiply(Color(backgroungColor))
            }
        }
    }
}


struct MainList_Previews: PreviewProvider {
    static var previews: some View {
        MainList().environmentObject(Env())
    }
}
