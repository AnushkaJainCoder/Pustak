
import Foundation
    import SwiftUI


    struct CategoryWiseBooks:View{
        
        let bookArray: [Book] = [
            Book(isbn:"r367216721t478121",bookName: "Game Of Thrones", bookAuthor: "By George R.R. Martin", bookImage: Image("bc1")),
        Book(isbn:"r36721167211t47821",bookName: "The house of the dragon", bookAuthor: "By George R.R. Martin", bookImage: Image("bc1")),
            
            Book(isbn:"r36721267211t47821",bookName: "The hundred thousand kingdoms", bookAuthor: "By N. K. Jemisin", bookImage: Image("bc1")),
            
            Book(isbn:"r36721367211t47821",bookName: "The Name of the Wind", bookAuthor: "By Patrick Rothfuss", bookImage: Image("bc1")),
            
            Book(isbn:"r367241672211t47821",bookName: "The Fellowship of the Ring", bookAuthor: "By J. R. R. Tolkien.", bookImage: Image("bc1")),
            Book(isbn:"r367211673211t47821",bookName: "house of the dragon", bookAuthor: "By George R.R. Martin", bookImage: Image("bc1")),
            
            Book(isbn:"r367212647211t47821",bookName: "The hundred thousand kingdoms", bookAuthor: "By N. K. Jemisin", bookImage: Image("bc1")),
            
            Book(isbn:"r367213567211t47821",bookName: "The Name of the Wind", bookAuthor: "By Patrick Rothfuss", bookImage: Image("bc1")),
            
            Book(isbn:"r367246167211t47821",bookName: "The Fellowship of the Ring", bookAuthor: "By J. R. R. Tolkien.", bookImage: Image("bc1"))
            
            
            
        ]
        let colum = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        @State private var searchText = ""
        
        var filterbooks: [Book]{
            if searchText.isEmpty{
                return bookArray
            }
            else{
              return  bookArray.filter{$0.bookName.localizedCaseInsensitiveContains(searchText)}
            }
        }
        
        var body: some View{
            
                ScrollView(.vertical){
                    
                    LazyVGrid(columns: colum, spacing: 20){

                        ForEach(filterbooks, id: \.isbn){book in
                            NavigationLink(destination: BookInfo()){
                                BookCover(bookName: book.bookName, authName: book.bookAuthor, width: 150, height: 210,BnamefontType: .title2,BauthorfontType: .caption)
                            }
                        }
                    }
                    .padding(.leading).padding(.trailing).padding(.top)
//                    
                }
                .navigationTitle("Fantasy books")
                .searchable(text: $searchText, prompt: "Search books").navigationBarTitle("Fantasy", displayMode: .inline).navigationBarTitleDisplayMode(.inline)
            
        }
    }

    struct CategoryViseBooks_Preview: PreviewProvider{
        static var previews: some View{
            CategoryWiseBooks()
        }
    }

