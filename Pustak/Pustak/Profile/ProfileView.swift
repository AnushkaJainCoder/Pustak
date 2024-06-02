//
//  LibrarianProfile.swift
//  Piyush-Librarian
//
//  Created by Sai Nirmit on 31/05/24.
//
import SwiftUI

struct MemberProfile: View {
    @State private var selectedLibrary = "Mysore DC"
    @State private var showLibrarySelection = false
    @State private var issuedBooks: [String] = ["Harry Potter", "Science", "Maths"]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Spacer()
                            Text("Sainirmit")
                                .font(.headline)
                            //                            Spacer()
                            Text("B.E. CSE")
                                .font(.caption)
                            Spacer()
                        }.padding(.leading)
                    }}
                Section(header: Text("Details")){
//                Section(head)
                    HStack {
                        Text("Email:")
                            .font(.subheadline)
                        
                        Spacer()
                        Text("sainirmit@gmail.com")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Phone:")
                            .font(.subheadline)
                        Spacer()
                        Text("+123 456 7890")
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Library:")
                            .font(.subheadline)
                        Spacer()
                        Text(selectedLibrary)
                            .font(.subheadline)
                        Button(action: {
                            showLibrarySelection.toggle()
                        })
                        {
                            HStack{
//                                Spacer()
                                Text("")
                                    .foregroundColor(.black)
                                
                            }
                        }
                        .listRowBackground(Color.black)
                    }
                }
                Section(header: Text("Contact Us")) {
                    HStack {
                        Text("Email:")
                            .font(.subheadline)
                        
                        Spacer()
                        Text("pustak@gmail.com")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Phone:")
                            .font(.subheadline)
                        Spacer()
                        Text("+91 9876543210")
                            .font(.subheadline)
                    }
                }
                Section(header: Text("Dues")){
                    HStack {
                        Text("Fine")
                            .font(.subheadline)
                        Spacer()
                        Text("Rs. 50")
                            .font(.subheadline)
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                    }
                    
                }
                
                Section(header: Text("Issued Books")) {DisclosureGroup {}
                label:
                    {
                        Text("My Books")
                            .font(.subheadline)
                    }
                }
//                Button(action: {
//                    showLibrarySelection.toggle()
//                })
//                {
//                    HStack{
//                        Spacer()
//                        Text("Switch Library")
//                            .foregroundColor(.white)
//                        Spacer()
//                    }
//                }
//                .listRowBackground(Color.black)
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $showLibrarySelection) {
                LibrarySelectionView(selectedLibrary: $selectedLibrary)
                    .presentationDetents([.medium, .fraction(0.30)])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

struct ContenttView_Previews: PreviewProvider {
    static var previews: some View {
        MemberProfile()
    }
}
