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
    var body: some View {
        
        NavigationStack{
            ScrollView{
                
                VStack{
                    //                    m1.displayWishList()
                    ForEach(m1.wishList, id: \.bookName){ book in
                        HStack{
                            VStack(alignment: .leading){
                                BookCover(bookName: book.bookName, authName: book.authName, width: 110, height: 150, BnamefontType: .title3)
                            }
                            VStack(alignment: .leading){
                                Text(book.bookName).font(.title)
                                Text("by \(book.authName)").font(.caption).foregroundColor(.gray).padding(.leading)
                                Spacer()
                                HStack{
                                    CustomButton(conntent: "Reserve")
                                    Button(
                                        action: { m1.removeFavourite(bookName: book.bookName)
                                           
                                        }
                                    ){
                                        CustomButton(conntent: "Remove")
                                    }
                                }
                            }.padding(.leading).padding(.trailing)
                            Spacer()
                            
                        }.padding(.leading).padding(.top).padding(.bottom).background(
                            
                        ).frame( alignment: .leading)
                        
                    }
                }.padding(.top)
                
            }.navigationTitle("Wishlist").searchable(text: $selection, prompt: "Search")
        }
    }
}

#Preview {
    WishList()
}
