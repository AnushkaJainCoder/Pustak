//import SwiftUI
//
//struct Book {
//    let bookName: String
//    let bookAuthor: String
//    let bookImage: Image
//}
//
//struct ContentView: View {
//    let trendingItems = [
//        Image("t1"),
//        Image("t2"),
//        Image("t5"),
//        Image("t6"),
//        Image("t2"),
//        Image("t1"),
//        Image("t2")
//    ]
//    
//    let genres = [
//        Image("g23"),
//        Image("g18"),
//     //   Image("g15"),
//        Image("g19"),
//        Image("g21"),
//        Image("g20"),
//        
//        Image("g22")
//    ]
//    
//    let recentlyBorrowed = [
//        Image("c3"),
//        Image("t6")
//    ]
//    
//    let continueReading = [
//        Book(bookName: "The World Is Not Enough", bookAuthor: "By Jeremy Black", bookImage: Image("c2"))
////        Book(bookName: "Reign Of Terror", bookAuthor: "By Spencer Ackerman", bookImage: Image("c3"))
//    ]
//    
//    var body: some View {
//        NavigationView{
//        
//        ScrollView {
//            
//            VStack(alignment: .leading) {
//                // Trending Section
//                Text("Trending")
//                    .font(.title2)
//                    .padding(.leading)
//                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 30) {
//                        ForEach(0..<trendingItems.count, id: \.self) { index in
//                            trendingItems[index]
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 150)
//                                .cornerRadius(9)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//                .padding(.bottom)
//                
//                // Continue Reading Section
//                Text("Continue Reading")
//                    .font(.title2)
//                    .padding(.leading)
//                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    VStack(alignment: .leading, spacing: 2) {
//                        ForEach(continueReading, id: \.bookName) { book in
//                            HStack(spacing: 2){
//                                VStack(alignment: .leading ,spacing: 2) {
//                                    book.bookImage
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: 70, height: 100)
//                                        .cornerRadius(9)
//                                }.padding(.bottom).padding(.top)
//                                VStack(alignment: .leading, spacing: 5){
//                                    Text(book.bookName)
//                                        .font(.title3).foregroundColor(.black)
//                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
//                                        
//                                    
//                                    Text(book.bookAuthor)
//                                        .font(.caption2).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
//                                        .foregroundColor(.gray)
//                                }.frame(maxWidth: .infinity).padding(.trailing)
//                                
//                            
//                            }.padding(.leading)      .background(Color(red: 233 / 255, green: 220 / 255, blue: 200 / 255)).cornerRadius(9)
//                            
//                        }}.padding(.leading).frame(width: 376)
//                    
//                }
//                .padding(.bottom).frame(maxWidth: .infinity)
//                
//                // Genres Section
//                Text("Genres")
//                    .font(.title2)
//                    .padding(.leading)
//                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 10) {
//                        ForEach(0..<genres.count, id: \.self) { index in
//                            genres[index]
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 200, height: 110)
//                                .cornerRadius(9)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//                .padding(.bottom)
//                
//                // Recently Borrowed Section
//                Text("Recently Borrowed")
//                    .font(.title2)
//                    .padding(.leading)
//                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 30) {
//                        ForEach(0..<recentlyBorrowed.count, id: \.self) { index in
//                            recentlyBorrowed[index]
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 100)
//                                .cornerRadius(9)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//                .padding(.bottom)
//            }
//        }.navigationTitle("Pustak")
//    }
//}
//}

import SwiftUI

struct ContentView: View{
    var body: some View{
        TabView{
            HomeView().tabItem{
                Image(systemName: "house.fill")
                Text("home")
            }
            CategoryBookView().tabItem{
                Image(systemName: "books.vertical")
                Text("Library")
            }
            MyBooksView().tabItem{
                Image(systemName: "book.fill")
                Text("My Books")
            }
            
            LibrarianProfileView().tabItem{
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }
}



#Preview {
    ContentView()
}
