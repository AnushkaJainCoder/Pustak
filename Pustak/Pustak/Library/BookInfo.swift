//
//  ContentView.swift
//  book
//
//  Created by Gautam Sharma on 30/05/24.
//

import SwiftUI

//struct Book: Identifiable {
//    let id = UUID()
//    let imageName: String
//    let name: String
//    let author: String
//}

struct BookInfo: View {
    @State private var showingAlert = false
    @State private var books: [Book] = []

    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 16) {
                if let firstBook = books.first {
                    
                    // Book cover and details
                    
                    HStack(alignment: .top, spacing: 16) {
                        firstBook.bookImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 200)
                            .cornerRadius(11)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(firstBook.bookName)
                                .font(.system(size: 28))
                                .fontWeight(.bold)
                            
                            Text("By \(firstBook.bookAuthor)")
                                .font(.system(size: 18))
                                .foregroundColor(.red)
                            
//                            Text("2 hr 35 min")
//                                .font(.system(size: 18))
                            
                            HStack(spacing: 2) {
                                ForEach(0..<5) { index in
                                    Image(systemName: index < 4 ? "star.fill" : "star")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 20))
                                }
                            }
                            
                            Text("4.8 (323)")
                                .font(.system(size: 18))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }

                // Reserve & heart button
                HStack(spacing: 20) {
                    Button(action: {
                        showingAlert = true
                    }) {
                        Text("Reserve")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        // Action for Heart Button
                    }) {
                        Image(systemName: "heart")
                            .padding()
                            .frame(width: 44, height: 44)
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                }
                
            
                Divider()
                
                // Summary section
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Summary")
                            .font(.headline)
                        Spacer()
                    }
                    
                    Text("""
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae odio nec nisi volutpat imperdiet. Ut non vehicula enim. Phasellus sapien nisi, imperdiet ac lobortis vitae, scelerisque sit amet augue.odio nec nisi volutpat imperdiet. Ut non vehicula enim. Phasellus sapien nisi, imperdiet ac lobortis vitae, scelerisque sit amet augue.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            .padding()
            
            // More like this book section
            VStack(alignment: .leading, spacing: 8) {
                Text("More like this")
                    .font(.headline)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(books, id: \.isbn) { book in
                            VStack {
                                book.bookImage
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(11)
                                    .clipped()
                                
                                Text(book.bookName)
                                    .font(.subheadline)
                                    .frame(maxWidth: 100)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.bottom)
            
            Spacer()
        }
        .onAppear(perform: fetchData)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Your book is reserved"), message: Text("Kindly collect it before 24 hrs or the reservation will be canceled."), dismissButton: .default(Text("OK")))
        }
    }

    private func fetchData() {
        // Dummy data
        let dummyBooks = [
//            Book(imageName: "book1", name: "Book 1", author: "Author 1"),
//            Book(imageName: "book2", name: "Book 2", author: "Author 2"),
//            Book(imageName: "book3", name: "Book 3", author: "Author 3"),
//            Book(imageName: "book4", name: "Book 4", author: "Author 4"),
//            Book(imageName: "book5", name: "Book 5", author: "Author 5")
            
            Book(isbn: "1213", bookName: "Book 1", bookAuthor: "XYZ", bookImage: Image("book1")),
            Book(isbn: "12131", bookName: "Book 2", bookAuthor: "XYZ", bookImage: Image("book2")),
            Book(isbn: "12132", bookName: "Book 3", bookAuthor: "XYZ", bookImage: Image("book3")),
            Book(isbn: "12133", bookName: "Book 4", bookAuthor: "XYZ", bookImage: Image("book4"))
            
        ]
        
        books = dummyBooks
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookInfo()
    }
}

