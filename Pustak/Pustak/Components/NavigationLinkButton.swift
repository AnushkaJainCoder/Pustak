//
//  NavigationLinkComponent.swift
//  Pustak
//
//  Created by apple on 04/06/24.
//

import Foundation
import SwiftUI

//enum ContentType{
//    case text
//    case image
//    
//    var contentType{
//    case .text:
//        return  Text("Issue").font(.subheadline)
//            .frame(alignment: .center)
//    case .image:
//        return 
//    }
//}
enum Content{
    case text
    case image
}

struct NavigationLinkComponent: View{
    //    var contentType: Content
    var text: String
    
    var body: some View{
        NavigationLink(destination: BookInfo()){
            
            //            Button(action: {
            //
            //            })
            //            {
            HStack{
                Spacer()
                Text(text) .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(alignment: .center)
                    .padding(.top)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .foregroundColor(.white)
                    .background(Color(#colorLiteral(red: 0.4862745098, green: 0.2470588235, blue: 0.2431372549, alpha: 1))) // Using specified color
                    .cornerRadius(9)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
                
                Spacer()
                
            }
            .cornerRadius(9).padding(.leading, 10)
            
        }
    }
}
#Preview {
    NavigationLinkComponent(text: "Issue")
}
