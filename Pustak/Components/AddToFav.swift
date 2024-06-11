//
//  CustomButton.swift
//  Pustak
//
//  Created by apple on 05/06/24.
//

import SwiftUI

struct AddToFav: View {
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
            .background(Color.red) // Using specified color
            .cornerRadius(9)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
        
    }
}

#Preview {
    AddToFav(conntent: "Add to Favourites")
}
