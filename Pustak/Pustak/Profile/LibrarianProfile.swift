//
//  LibrarianProfile.swift
//  Pustak
//
//  Created by apple on 31/05/24.
//

import Foundation
import SwiftUI

struct LibrarianProfileView: View{
    var body: some View{
        NavigationView{
            List{
                Section{
                    HStack(spacing: 10){
                        Image(systemName: "building.columns").resizable().frame(width: 75, height: 75)
                        VStack(alignment: .leading){
                            Spacer()
                            //
                            Text("Chitkara CSE Library").font(.title3)
                            Text("Chitkara University, Punjab").font(.caption2).foregroundColor(.gray)
                            Spacer()
                            
                        }.padding(.leading, 20)
                    }}
                Section(header: Text("Details")){
                    HStack{
                        Text("Librarian:").font(.subheadline)
                        Spacer()
                        Text("Anushka Jain").font(.subheadline)
                    }
                    HStack{
                        //                    Text("Anushka Jain").font(.headline)
                        Text("Email:").font(.subheadline)
                        Spacer()
                        Text("csechitkaralibrary@gmail.com").font(.subheadline)
                        
                    }
                    HStack{
                        Text("Contact:").font(.subheadline)
                        Spacer()
                        Text("+91 9089786767").font(.subheadline)
                    }
                    HStack{
                        Text("Location:").font(.subheadline)
                        Spacer()
                        Text("Near Turing Block, Chitkara University, Punjab").font(.subheadline)
                    }
                }
                
                Section(header: Text("Contact us")){
                    HStack{
                        Text("Email:").font(.subheadline)
                        Spacer()
                        Text("pustak@gmail.com").font(.subheadline)
                    }
                    HStack{
                        Text("Phone:").font(.subheadline)
                        Spacer()
                        Text("+91 9876543210").font(.subheadline)
                    }
                }
                //                Section(header: Text("logIn")){
                //                    HStack{
                //                        Text("login")
                //                    }
                //                }
            }.navigationTitle("Profile")
        }
    }
}
struct ContentViewS: PreviewProvider{
    static var previews: some View{
        LibrarianProfileView()
    }
}
