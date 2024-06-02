//    [3:02 PM, 31/5/2024] Rishita Ios:
import Foundation
    import SwiftUI

//    struct Book {
//        let isbn:String
//        let bookName: String
//        let bookAuthor: String
//        let bookImage: Image
//    }

    struct CategoryWiseBooks:View{
        
        let bookArray: [Book] = [
            Book(isbn:"r367216721t478121",bookName: "Game Of Thrones", bookAuthor: "By George R.R. Martin", bookImage: Image("book1")),
//            Book(isbn:"r367216721t47821",bookName: "Percy Jackson And The Lightning Thief ", bookAuthor: "By Rick Riordan ", bookImage: Image("h2")),
//            
//            Book(isbn:"r367216721t4781221",bookName: "City Of Bones", bookAuthor: "By Cassandra Clare", bookImage: Image("h3")),
//            Book(isbn:"r3672167211t47821",bookName: "The Immortals Of Mehula", bookAuthor: "By Amish", bookImage: Image("h4")),
            
            Book(isbn:"r36721167211t47821",bookName: "house of the dragon", bookAuthor: "By George R.R. Martin", bookImage: Image("v5")),
            
            Book(isbn:"r36721267211t47821",bookName: "The hundred thousand kingdoms", bookAuthor: "By N. K. Jemisin", bookImage: Image("v4")),
            
            Book(isbn:"r36721367211t47821",bookName: "The Name of the Wind", bookAuthor: "By Patrick Rothfuss", bookImage: Image("v1")),
            
            Book(isbn:"r367241672211t47821",bookName: "The Fellowship of the Ring", bookAuthor: "By J. R. R. Tolkien.", bookImage: Image("v2")),
            Book(isbn:"r367211673211t47821",bookName: "house of the dragon", bookAuthor: "By George R.R. Martin", bookImage: Image("v5")),
            
            Book(isbn:"r367212647211t47821",bookName: "The hundred thousand kingdoms", bookAuthor: "By N. K. Jemisin", bookImage: Image("v4")),
            
            Book(isbn:"r367213567211t47821",bookName: "The Name of the Wind", bookAuthor: "By Patrick Rothfuss", bookImage: Image("v1")),
            
            Book(isbn:"r367246167211t47821",bookName: "The Fellowship of the Ring", bookAuthor: "By J. R. R. Tolkien.", bookImage: Image("v2"))
            
            
            
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
            NavigationView{
                ScrollView(.vertical){
                    
                    LazyVGrid(columns: colum, spacing: 20){
                        //                VStack(alignment: .leading){
                        ForEach(filterbooks, id: \.isbn){index in
                            NavigationLink(destination: BookInfo()){
                                VStack{
                                    index.bookImage.resizable().frame(width: 150, height: 190).cornerRadius(9)
                                    Text(index.bookName).font(.caption).foregroundColor(.primary)
                                    Text(index.bookAuthor).font(.caption2).foregroundColor(.gray)
                                }
                            }
                        }
                    }.padding(.leading).padding(.trailing).padding(.top)
                    
                }.searchable(text: $searchText, prompt: "Search books").navigationBarTitle("Fantasy", displayMode: .inline).navigationBarTitleDisplayMode(.inline)
            }
        }
    }

    struct CategoryViseBooks_Preview: PreviewProvider{
        static var previews: some View{
            CategoryWiseBooks()
        }
    }

