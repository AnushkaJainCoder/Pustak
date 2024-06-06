//
//  CustomButton.swift
//  Pustak
//
//  Created by apple on 05/06/24.
//

import SwiftUI

struct CustomButton: View {
    var conntent: String
    var body: some View {
       
        Text(conntent)
            .font(.subheadline)
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
        
    }
}

#Preview {
    CustomButton(conntent: "Reserve")
}
