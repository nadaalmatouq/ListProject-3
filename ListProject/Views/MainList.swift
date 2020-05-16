//
//  MainList.swift
//  ListProject
//
//
/* problems we've faced:
 
 *the image we want it to be a uiimage and not a string in our struct
 *custom navigation title   // do it again
 *background color should appear with the list
 * when click on the list (sunday's grocery) it will navigate to the next screen
 */
//
//

import SwiftUI

struct MainList: View {
    @State var OverallList : OverallList
    var body: some View {
        VStack{
            
            NavigationView{
                

                List{
                    NavigationLink(destination: Temp()){
                        Text("Add to your list")
                    }
                                        MainListDetail(OverallList: TotalList[0])
                    MainListDetail(OverallList: TotalList[1])
                    MainListDetail(OverallList: TotalList[2])
                }.navigationBarTitle("To Do List")

                
            }
        }
    }
    
}
//
//                .edgesIgnoringSafeArea(.all)


//VStack{
//NavigationView{
//                    List(TotalList){ list in
//                        VStack(spacing: 50){
//                            HStack{
//                                Text(list.MainName)
//                                Button(action: {
//
//                                    }) {
//                                        Image(systemName: "plus.circle")
//
//                                }
//                            }
//
//                            ScrollView(.horizontal){
//
//                                Image("travel")
//                                    .resizable()
//                                    .edgesIgnoringSafeArea(.all)
//                                    .frame(width: 90, height: 90, alignment: .leading)
//                                Text(list.DetailName.joined())
//
//                            }
//                        }
//                  //  }
//                  //  .navigationBarTitle("To Do List")
//
//
//
//
//
//                //}
//            }














struct MainList_Previews: PreviewProvider {
    static var previews: some View {
        MainList(OverallList: Grocery)
    }
}
