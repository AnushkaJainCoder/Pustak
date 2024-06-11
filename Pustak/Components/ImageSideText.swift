//
//  ImageSideText.swift
//  Pustak
//
//  Created by apple on 04/06/24.
//

import Foundation
import SwiftUI

struct ImageSideText: View {
    var bookName: String
    var bookAuthor: String
    var text: String
   
    var body: some View {
        VStack(alignment: .leading){
            
            BookCover(bookName: bookName, authName: bookAuthor, width: 150, height: 230, BnamefontType: .title, BauthorfontType: .caption).padding(.leading, 20)
                .padding(.trailing, 20)
              
                
               
               
        }.frame(width: 150, height: 230)
        VStack(alignment: .leading){
            Text(bookName)
                .font(.title)
                .foregroundColor(.primary).padding(.leading, 10).padding(.top, 20)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).lineLimit(nil).fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            Text(bookAuthor)
                .font(.subheadline).padding(.leading, 10)
                .foregroundColor(.gray)
                .padding(.bottom)
            Spacer()
            NavigationLinkComponent(text: text)
    
            
        }.frame(width: 200)
    }
}
