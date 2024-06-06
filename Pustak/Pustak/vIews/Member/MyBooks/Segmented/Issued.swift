//
//  Requested.swift
//  Pustak
//
//  Created by apple on 02/06/24.
//

import Foundation
import SwiftUI

struct IssuedView: View{
    @State private var selection = 0
    var body: some View{
        NavigationStack{
            ScrollView(.vertical){
                HStack{
                    Text("History").font(.title2).fontWeight(.semibold).padding(.leading, 10)
                    Spacer()
                    Picker( selection: $selection, label: Text("Picker")){
                        Text("All").tag(0).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.leading, 20)
                        Text("Today").tag(1).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                    }
                }.padding(.leading, 10)
                
                if(selection == 0){
                    ForEach(myData, id:\.bookName) { data in
                        NavigationLink(destination: BookInfo()){
                            IssuedComponent( bookName: data.bookName, bookAuthor: data.authName, approved: true, issueDate: data.issueDate ?? Date(), returnDate: data.returnDate ?? Date())
                        }
                    }
                }
                else if(selection == 1){
                    
                    ForEach(myData.filter{m1.isToday($0.approvedDate ?? Date()) }, id:\.bookName) { data in
                        NavigationLink(destination: BookInfo()){
                            IssuedComponent( bookName: data.bookName, bookAuthor: data.authName, approved: true, issueDate: data.issueDate ?? Date(), returnDate: data.returnDate ?? Date())
                        }
                    }
                    
                }
            }
        }
    }
}

struct IssuedContentView: PreviewProvider{
    static  var previews: some View{
        IssuedView()
    }
}
