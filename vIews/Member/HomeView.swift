//
//  HomeView.swift
//  Pustak
//
//  Created by apple on 30/05/24.
//

import Foundation
import SwiftUI

struct Book {
    let isbn:String
    let bookName: String
    let bookAuthor: String
    let bookImage: Image
}


struct HomeView: View{
    let continueReading = [
                    Book(isbn:"r367216721t478121",bookName: "The World Is Not Enough", bookAuthor: "By Jeremy Black", bookImage: Image("bc1")),
        Book(isbn:"r367216721t47821",bookName: "Reign Of Terror", bookAuthor: "By Spencer Ackerman", bookImage: Image("bc1"))
    ]
    let trendingItems = [
        Book(isbn:"r367216721t478121",bookName: "Harry Potter Part2", bookAuthor: "By JK Rawling", bookImage: Image("bc1")),
Book(isbn:"r367216721t47821",bookName: "Cold Blooded Love", bookAuthor: "By Spencer ", bookImage: Image("bc1")),
        Book(isbn:"r367216721t4781221",bookName: "The World Is Not Enough", bookAuthor: "By Jeremy Black", bookImage: Image("bc1")),
Book(isbn:"r3672167211t47821",bookName: "The Known World", bookAuthor: "By Spencer Ackerman", bookImage: Image("bc1"))
        ]
    
    @State private var centerIndex : Int? = nil
    
    @State private var  searchText = ""
    var book: Book
    
    var body: some View{
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    Text("Requested").font(.title2).fontWeight(.semibold).padding(.leading).padding(.trailing).padding(.top)
                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 16) {
                                            ForEach(continueReading, id: \.isbn) { book in
                                                HStack {
                                                    BookCover(bookName: book.bookName, authName: book.bookAuthor, width: 100, height: 150, BnamefontType: .caption)
                                                        .cornerRadius(10)
                                                        .shadow(radius: 5)
                                                    VStack(alignment: .leading, spacing: 8) {
                                                        Text(book.bookName)
                                                            .font(.title2)
                                                            .fontWeight(.semibold)
                                                            .fixedSize(horizontal: false, vertical: true)
                                                            .foregroundColor(.primary)
                                                            .multilineTextAlignment(.leading)
                                                        Text("by \(book.bookAuthor)")
                                                            .font(.subheadline)
                                                            .foregroundColor(.secondary)
                                                        Spacer()
                                                        CustomButton(conntent: "Approved", color: Color.gray)
                                                    }
                                                    .padding()
                                                    Spacer()
                                                }
                                                .padding()
                                                .frame(width: 340, height: 180)
                                                .background(
                                                    LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBackground), Color(UIColor.secondarySystemBackground)]),
                                                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                                                )
                                                .cornerRadius(10)
                                                .shadow(radius: 5)
                                            }
                                        }
                                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 20))
                                       }
//                    Text("Categories").font(.title2).fontWeight(.semibold).padding(.leading)
                            
                    CategoryBookView()
//                    ScrollView(.horizontal, showsIndicators: false){
//                        HStack(spacing: 20){
//                        ForEach(Array(trendingItems.enumerated()), id: \.1.isbn) { index,book in
//                            NavigationLink(destination:BookInfo())
//                            {
//                                BookCover(bookName: book.bookName, authName: book.bookAuthor, width: 130, height: 210,BnamefontType: .title2,BauthorfontType: .caption)
//                            }
//                            }.frame(width: 130, height: 210)
//                    }.padding(EdgeInsets(top: 0,leading: 10, bottom: 20, trailing: 10))
//                        
//                    }.padding(.bottom)
   
                }}.navigationTitle("Pustak")
        }.searchable(text: $searchText, prompt: "Search Your Book").searchable(text: $searchText, prompt: "Search")
        }
    }
struct HomeView_Preview: PreviewProvider{
    static var previews: some View{
        HomeView(book:  Book(isbn:"r367216721t478121",bookName: "Harry Potter Part2", bookAuthor: "By JK Rawling", bookImage: Image("bc1")))
    }
}

