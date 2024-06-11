//
//  WishList.swift
//  Pustak
//
//  Created by apple on 06/06/24.
//

import Foundation
import SwiftUI

struct WishList: View {
    @State private var selection = ""
    @StateObject var m1 = MemberManager()
    var book: Book
   
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(m1.wishList, id: \.bookName) { book in
                        HStack {
                            BookCover(bookName: book.bookName, authName: book.authName, width: 100, height: 150, BnamefontType: .caption)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(book.bookName)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                
                                Text("by \(book.authName)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                HStack {
                                    Button(action:{
                                        // Action for "Issue" button
//                                        m1.addFavourite(book: book)
                                    }){
                                        CustomButton(conntent: "Issue", color: .blue)
                                    }
                                    
                                    Button(action: {
                                        m1.removeFavourite(bookName: book.bookName) // Remove book from wishlist
                                    }) {
                                        CustomButton(conntent: "Remove", color: .red)
                                    }
                                }
                            }
                            .padding(.leading)
                            
                            Spacer()
                        }
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBackground), Color(UIColor.secondarySystemBackground)]),
                                           startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding()
            }
            .navigationTitle("Wishlist")
            .searchable(text: $selection, prompt: "Search")
        }
    }
}

#Preview {
    WishList(book:  Book(isbn:"r367216721t4781221",bookName: "The World Is Not Enough", bookAuthor: "By Jeremy Black", bookImage: Image("bc1")))
}
