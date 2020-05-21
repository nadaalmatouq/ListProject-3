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
   // @State var OverallList : [OverallList] = TotalList
   
    var backgroungColor = "Background"
    @State var isWorkWillAdd = false
    @State var isWorkWillEdit = false   //DONT FORGET TO TOGGLE IT SO WHEN YOU COME BACK AFTER THE FIRST TIME ITS NOT ALWAYS TRUE
    @State var nameList = ""
    var body: some View {
        NavigationView{
            ZStack {
                Color(backgroungColor)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        NavigationLink(destination: CreateNewList().environmentObject(self.env), isActive: $isWorkWillAdd){
                            Text("")
                        }
                        NavigationLink(destination: TravelListDetails().environmentObject(self.env), isActive: $isWorkWillEdit){
                           Text("")
                        }
                        
                    }
           
                              VStack{
                                  
                                Text(self.env.alltravelLists[0].lista.type.name())
                                      .foregroundColor(Color.black)
                                      .bold()
                                      .font(.system(size:24))
                                           }
                
                    
                    
                    ForEach(self.env.alltravelLists, id: \.self){ i in
                                                       VStack{
                                                  Text(i.lista.givenName)
                                                  .foregroundColor(Color.black)
                                                  .bold()
                                                  .font(.system(size:24))
                                                       }.padding(.vertical,2)
                                                   
                                      .onTapGesture {
                                                                                        self.isWorkWillEdit = true
                                                                                     self.env.currentTravelList = i
                                                                                            //print(self.env.alltravelLists)
                    ////                                                                      self.nameList = OneListLoop.lista.givenName
                                                                                }
                            
                     }
                
                    
//                    List(self.env.alltravelLists){ OneListLoop in
//
//                          VStack  {
//                                                        Text(OneListLoop.lista.givenName)
//                                                            .foregroundColor(Color.black)
//                                                            .bold()
//                                                            .font(.system(size:24))
//
//
//                                                      //  Text(OneListLoop.lista.givenName)
//                            //                          ScrollView(.horizontal, showsIndicators: false){
//                            //                              HStack(spacing:60){
//                            //                                ForEach(OneListLoop , id: \.self){ (Travel: TravelList) in
//                            //                                      VStack{
//                            ////                                          Image(name)
//                            ////                                              .resizable()
//                            ////                                              .edgesIgnoringSafeArea(.all)                    .frame(width: 100, height: 100, alignment: .leading)
//                            //                                        Text(Travel.lista.givenName)
//                            //                                              .foregroundColor(Color.black)
//                            //
//                            //                                      }
//                                                                  .onTapGesture {
//                                                                      self.isWorkWillEdit = true
////                                                                    self.env.currentTravelList = OneListLoop
//                                                                        print(self.env.alltravelLists)
////                                                                      self.nameList = OneListLoop.lista.givenName
//                                                                  }
//                            //                                  }
//                            //                              }
//                            //                          }
//                                                    }
////
////
//
//                          //  Text(OneListLoop.lista.givenName)
////                          ScrollView(.horizontal, showsIndicators: false){
////                              HStack(spacing:60){
////                                ForEach(OneListLoop , id: \.self){ (Travel: TravelList) in
////                                      VStack{
//////                                          Image(name)
//////                                              .resizable()
//////                                              .edgesIgnoringSafeArea(.all)                    .frame(width: 100, height: 100, alignment: .leading)
////                                        Text(Travel.lista.givenName)
////                                              .foregroundColor(Color.black)
////
////                                      }
////                                      .onTapGesture {
////                                          self.isWorkWillEdit = true
////                                          //self.nameList = name
////                                      }
////                                  }
////                              }
////                          }
//                        }
                    }
//                        List(self.env.alltravelLists) { OneListLoop in
//                                                      VStack
//                                                  }
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



struct MainList_Previews: PreviewProvider {
    static var previews: some View {
        MainList().environmentObject(Env())
    }
}
