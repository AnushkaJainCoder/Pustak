//
//  IssuedComponent.swift
//  Pustak
//
//  Created by apple on 05/06/24.
//

import Foundation
import SwiftUI


struct IssuedComponent: View{
    //    var image: String =  "bc1"
    var bookName = "ABC"
    var bookAuthor = "ABC"
    var approved: Bool
    var issueDate: Date
    var returnDate: Date
    
    
    var body: some View{
//        NavigationStack{
//            NavigationLink(destination: BookInfo()){
                HStack{
                    VStack(alignment: .leading){
                        BookCover(bookName: bookName, authName: bookAuthor, width: 90, height: 120,BnamefontType: .caption,BauthorfontType: .caption)
                    }.padding(.leading, 10)
                    VStack{
                        Spacer()
                        VStack(alignment: .leading){
                            Text(bookName).font(.title3).fontWeight(.semibold)
                            Text("~ \(bookAuthor)").font(.caption).foregroundColor(.gray).padding(.bottom, 4)
                            HStack{
                                Text("Issued on").font(.caption2).foregroundColor(.gray).padding(.leading, 10).padding(.trailing, 20)
                                Spacer()
                                Text("Return by").font(.caption).foregroundColor(.gray).padding(.leading, 20)
                                Spacer()
                                
                            }
                            
                            HStack{
                                IssuedDateText(text: m1.formattedDate(issueDate) ?? "2024/06/05" ,color: .green ).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                IssuedDateText(text: m1.formattedDate(returnDate)  ?? "2024/06/05" ,color: .cyan ).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                Spacer()
                            }
                            
                            Spacer()
                        }
                        
                    }.frame(width: 200,height: 100 ).padding(.leading, 10).padding(.trailing, 70).background(LinearGradient(
                        gradient: Gradient(colors: [Color.gray.opacity(0.43), Color.gray.opacity(0.2)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )).cornerRadius(9)
                    Spacer()
                }
            }
        }
//    }
//}

#Preview {
    IssuedComponent( bookName: "abc", bookAuthor: "op", approved: true, issueDate: Date(), returnDate: Date())
}
