//
//  BookTopContent.swift
//  Pustak
//
//  Created by apple on 06/06/24.
//

import Foundation
import SwiftUI

struct BookTopContent: View {
    var bookName: String
    var bookAuthor: String
    @State private  var showingAlert = false
//    var showingAlert: func
    var body: some View {
        
        VStack(alignment: .leading) {

            Text(bookName)
                .font(.title)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading).padding(.leading, 20).padding(.top, 20)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(bookAuthor)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading, 20).padding(.bottom, 2)
            
            Text("500 pages")
                .font(.caption)
                .foregroundColor(.accent)
                .padding(.bottom).padding(.leading, 20)
            Spacer()
            VStack{
                Button(action: {
                    showingAlert.toggle()
                    m1.addRequest(book: BookStatus(approved: false, pending: true, bookName: bookName, bookImage: "bc1", authName: bookAuthor, like: false))
                }) {
                    CustomButton(conntent: "Reserve")
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Your book is reserved"), message: Text("Kindly collect it before 24 hrs or the reservation will be canceled."), dismissButton: .default(Text("OK")))
                }
                Button(action:{
                    m1.addFavourite(book: BookStatus(approved: false, pending: false, bookName: bookName, bookImage: "bc1", authName: bookAuthor, like: true))
                }){
                    AddToFav(conntent: "Add To Favourites")
                  
                
            }
            
            }.padding(.leading, 20).padding(.bottom, 20)
        }
        .frame(width: 200)
    }
}
