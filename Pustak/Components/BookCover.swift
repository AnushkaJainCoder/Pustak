//
//  BookCover.swift
//  Pustak
//
//  Created by apple on 04/06/24.
//

import Foundation
import SwiftUI

enum FontStyleType{
    case title
    case title2
    case title3
    case caption
    case body
    
    var font: Font{
        switch self{
        case .title:
            return .title
        case .body:
            return .body
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .caption:
            return .caption
        }
        
    }
}
struct VerticalDivider: View{
    var x: CGFloat = 1
//    var y: CGFloat = 1
    var body: some View{
        Rectangle().fill(Color.white).frame(width: x)
    }
    
}

struct BookCover: View{
    var bookName:String
    var authName:String
    var width: CGFloat
    var height: CGFloat
    var BnamefontType: FontStyleType = .title
    var BauthorfontType: FontStyleType = .caption
    
    
    var body: some View{
        var bookCoverColor:[Color] = [Color.cyan, Color.red, Color.orange]
        var lineargradients: [LinearGradient] = [
            LinearGradient(colors: [.pink.opacity(0.4), .pink], startPoint: .topLeading, endPoint: .bottomTrailing),
            LinearGradient(colors: [.cyan.opacity(0.4), .cyan], startPoint: .topLeading, endPoint: .bottomTrailing),
            LinearGradient(colors: [.green.opacity(0.4), .green], startPoint: .topLeading, endPoint: .bottomTrailing),
            LinearGradient(colors: [.blue.opacity(0.4), .orange], startPoint: .topLeading, endPoint: .bottomTrailing),

            
        ]
       
        
        let randomColor = lineargradients.randomElement()
        HStack{
            VStack(alignment: .leading){
                VerticalDivider().frame(height: height)
                
            }.padding(.leading,8)
            
            VStack(alignment: .leading){
                Text("\(bookName)").font(BnamefontType.font).fontWeight(.bold)
                    .multilineTextAlignment(.leading).foregroundColor(.white).padding(.top).padding(.trailing,2).padding(.leading, 5)
                Spacer()
                Text("\(authName)").font(BauthorfontType.font).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.white).padding(.top).padding(.leading, 5).padding(.trailing,2).padding(.bottom)
//                Spacer()
                
            }
            Spacer()
        }.frame(width: width, height: height).background(randomColor)
    }
}

#Preview{
    BookCover(bookName: "A day in life of Anushka", authName: "Amol", width: 150, height: 200)
}
