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
//    var book: BookStatus
    @State private  var showingAlert1 = false
    @State private  var showingAlert2 = false
    
    @State private var isReserved = false
    @State private var isFav = false
    @State private var buttonColor1 = Color(#colorLiteral(red: 0.4862745098, green: 0.2470588235, blue: 0.2431372549, alpha: 1))
    @State private var buttonColor2 = Color(#colorLiteral(red: 0.4862745098, green: 0.2470588235, blue: 0.2431372549, alpha: 1))
    
    @State private var content1 = "Issue"
    @State private var content2 = "Add To Favouries"
    
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
                    showingAlert1.toggle()
                    
                }) {
                    CustomButton(conntent: content1, color: buttonColor1)
                }.disabled(isReserved).alert(isPresented: $showingAlert1) {
                    Alert(title: Text("Your book is reserved"), message: Text("Kindly collect it before 24 hrs or the reservation will be canceled."),
                          dismissButton: .default(Text("OK")){
                            isReserved = true
                        buttonColor1 = .gray
                        content1 = "Request Sent"
                        m1.addRequest(book: BookStatus(approved: false, pending: true, bookName: bookName, bookImage: "bc1", authName: bookAuthor, like: false))
//                        nntent: "Reserve", color: Color.gray)
                       
                    }
                    
                    )
                }
                Button(action:{
                    showingAlert2.toggle()
//                    m1.addFavourite(book: BookStatus(approved: false, pending: true, bookName: bookName, bookImage: "", authName: bookAuthor, like: true))
                }){
//                    AddToFav(conntent: "Add To Favourites")
                    CustomButton(conntent: content2, color: buttonColor2)
                  
                
                }.disabled(isFav).alert(isPresented: $showingAlert2){
                    Alert(title: Text("Book added to favourites successfully"),
                          dismissButton: .default(Text("ok")){
                        isFav = true
                        buttonColor2 = .gray
                        content2 = "Added successfully"
                        m1.addFavourite(book: BookStatus(approved: false, pending: false, bookName: bookName, bookImage: "bc1", authName: bookAuthor, like: true))
                    }
                    )
                }
            
            }.padding(.leading, 20).padding(.bottom, 20)
        }
        .frame(width: 200)
    }
}


//#Preview {
//    BookTopContent(bookName: "kjk", bookAuthor: "bjkojo")
//}
