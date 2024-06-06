import SwiftUI

struct BookInfo: View {
    @State private var showingAlert = false
    @State private var books: [Book] = []
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 16) {
                        if let firstBook = books.first {
                            HStack(alignment: .top, spacing: 16) {
                                VStack(alignment: .leading) {
                                    BookCover(bookName: firstBook.bookName, authName: firstBook.bookAuthor, width: 140, height: 220, BnamefontType: .title, BauthorfontType: .caption)
                                        .padding(.leading, 20)
                                }
                                .frame(width: 150, height: 250)
                                BookTopContent(bookName: firstBook.bookName, bookAuthor: firstBook.bookAuthor)
                            }
                        }
                        Divider().background(Color.primary)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Summary")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding(.bottom, 4)
                            HStack{
                                Text("""
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae odio nec nisi volutpat imperdiet. Ut non vehicula enim. Phasellus sapien nisi, imperdiet ac lobortis vitae, scelerisque sit amet augue.odio nec nisi volutpat imperdiet. Ut non vehicula enim. Phasellus sapien nisi, imperdiet
                        """).multilineTextAlignment(.leading)
                                    .font(.subheadline)
                                    .foregroundColor(.primary)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 9)
                                            .fill(Color(UIColor.secondarySystemBackground))
                                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                                    ).frame( alignment: .leading)
                                Spacer()
                            }.padding(.trailing, 4).padding(.bottom, 20)
                            Spacer()
                        }
                        .padding(.leading, 20)
                        
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("More like this")
                            .font(.title2)
                            .padding(.leading).fontWeight(.semibold)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(books, id: \.isbn) { book in
                                    VStack {
                                        BookCover(bookName: book.bookName, authName: book.bookAuthor, width: 130, height: 190, BnamefontType: .title3, BauthorfontType: .caption)
                                            .padding(.leading, 5)
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
            }
        }
    }
        
        private func fetchData() {
            let dummyBooks = [
                Book(isbn: "1213", bookName: "The World Is Not Enough ", bookAuthor: "By Jeremy Black", bookImage: Image("bc1")),
                Book(isbn: "12131", bookName: "Book 2", bookAuthor: "XYZ", bookImage: Image("bc1")),
                Book(isbn: "12132", bookName: "Book 3", bookAuthor: "XYZ", bookImage: Image("bc1")),
                Book(isbn: "12133", bookName: "Book 4", bookAuthor: "XYZ", bookImage: Image("bc1"))
            ]
            
            books = dummyBooks
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookInfo()
    }
}
