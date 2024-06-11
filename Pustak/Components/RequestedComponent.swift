//
//  RequestedComponent.swift
//  Pustak
//
//  Created by apple on 04/06/24.
//

import Foundation
import SwiftUI

struct RequestedComponent: View{
    var image: String =  "bc1"
    var bookName = "ABC"
    var bookAuthor = "ABC"
    var approved: Bool
    var approvedDate = Date()
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                BookCover(bookName: bookName, authName: bookAuthor, width: 90, height: 120,BnamefontType: .caption,BauthorfontType: .caption)
            }.padding(.leading, 10)
                VStack{
                    Spacer()
                    VStack(alignment: .leading){
                        Text(bookName).font(.title3).fontWeight(.semibold)
                        Text("~ \(bookAuthor)").font(.caption).padding(.bottom, 5).foregroundColor(.gray)
                        HStack{
                                if(approved == true){
                                    IssuedDateText(text: "Accepted", color: .green)
                                }
                                else{
                                    IssuedDateText(text: "Pending", color: .orange)
                                }
                            if(approved == true){
                                IssuedDateText(text: m1.formattedDate(approvedDate) ?? "2024/06/05"  , color: .purple)
                            }
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

#Preview {
    RequestedComponent(image: "bc1", bookName: "abc", bookAuthor: "op", approved: true, approvedDate: Date())
}
