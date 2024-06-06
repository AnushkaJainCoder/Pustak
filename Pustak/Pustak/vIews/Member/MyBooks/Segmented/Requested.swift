//
//  Requested.swift
//  Pustak
//
//  Created by apple on 02/06/24.
//

import Foundation
import SwiftUI

struct RequestedView: View{
    @State private var selection = 0
    var body: some View{
        //        NavigationView{
        ScrollView(.vertical){

            HStack{
                Text("History").font(.title2).fontWeight(.semibold).padding(.leading, 10)
                Spacer()
                Picker( selection: $selection, label: Text("Picker")){
                    Text("All").tag(0).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.leading, 20)
                    Text("Today").tag(1).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Pending").tag(2)
                    
                }
            }.padding(.leading, 10)
            
            if(selection == 0){
   
                ForEach(myData, id:\.bookName) { data in
                    NavigationLink(destination: BookInfo()){
                        RequestedComponent(image: data.bookImage, bookName: data.bookName, bookAuthor: data.authName, approved: data.approved , approvedDate: data.approvedDate ?? Date())
                    }
                }
            }
            else if(selection == 1){
                
                ForEach(myData.filter{m1.isToday($0.approvedDate ?? Date()) }, id:\.bookName) { data in
                    NavigationLink(destination: BookInfo()){
                        RequestedComponent(image: data.bookImage, bookName: data.bookName, bookAuthor: data.authName, approved: data.approved , approvedDate: data.approvedDate ?? Date())
                    }
                }
            }
            
            else if(selection == 2){
                ForEach(myData.filter{m1.isToday($0.approvedDate ?? Date()) }, id:\.bookName) { data in
                    NavigationLink(destination: BookInfo()){
                        RequestedComponent(image: data.bookImage, bookName: data.bookName, bookAuthor: data.authName, approved: data.approved , approvedDate: data.approvedDate ?? Date())
                    }
                }
            }
        }
    }
}
struct MyBooks_Preview1: PreviewProvider{
    static var previews: some View{
        RequestedView()
    }
}
