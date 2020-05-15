//
//  MainList.swift
//  ListProject
//
//
/* problems we've faced:
 
 *the image we want it to be a uiimage and not a string in our struct
 *custom navigation title
 *how to move to another view without navigation link (on tap gesture?)
 *background color should appear with the list
 *edit should be able to delete the detail lists that we have
 
 */
//
//

import SwiftUI

struct MainList: View {
    @State var OverallList : OverallList
//    @State private var isActive : Bool = false
    var body: some View {
        ZStack{
            Color("Background")
            NavigationView{
                VStack{
                NavigationLink(destination: Temp()){
                    Text("hello")
                }
//                    Button(action: {
//                        self.isActive = true
//                    }){
//                Button("click here")
                //{
//                            self.isActive = true

                      //  }
//                        Image(systemName: "plus.circle")
//                            .foregroundColor(Color("red"))
//                            .offset(x:-170,y:-380)
//                            .frame(alignment: .leading)
//                            .font(.system(size: 30))
                        
                    }
                
            
            }
            
            Text("To Do List")
                .bold()
                .foregroundColor(Color.black)
                .offset(y:-300)
                .font(.system(size: 50))
            
            
            VStack{
                List{
                    MainListDetail(OverallList: TotalList[0])
                    MainListDetail(OverallList: TotalList[1])
                    MainListDetail(OverallList: TotalList[2])
                }
                
            }.offset(y:200)
            
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
