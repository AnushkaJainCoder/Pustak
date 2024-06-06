//
//  IssuedDateText.swift
//  Pustak
//
//  Created by apple on 05/06/24.
//

import Foundation
import SwiftUI

struct IssuedDateText: View{
    var text: String
    var color: Color
    var body: some View{
        Text(text).foregroundColor(color).font(.subheadline)
            .padding(EdgeInsets(top: 5, leading: 6, bottom: 5, trailing: 6)).background(LinearGradient(
                gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            )).cornerRadius(9)
    }
}
