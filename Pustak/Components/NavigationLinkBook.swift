//
//  NavigationLinkBook.swift
//  Pustak
//
//  Created by apple on 04/06/24.
//

import Foundation
import SwiftUI

//enum StackT{
//    case hstack
//    case vstack
//    
//    var stack: Stack
//}


struct NavigationLinkBook: View{
//    var stackType: Stack
    var bookName:String
    var authName:String
    var width: CGFloat
    var height: CGFloat
    var BnamefontType: FontStyleType
    var BauthorfontType: FontStyleType 
    
    var body: some View{
        NavigationLink(destination: BookInfo()){
            VStack(alignment: .leading){
                BookCover(bookName: bookName, authName: authName, width: width, height: height, BnamefontType: BnamefontType, BauthorfontType: BauthorfontType).padding(.leading, 5)
            }.frame(width: 700, height: 80)
        }
    }
}
