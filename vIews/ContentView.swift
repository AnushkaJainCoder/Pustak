import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView(book:  Book(isbn:"r367216721t478121",bookName: "Harry Potter Part2", bookAuthor: "By JK Rawling", bookImage: Image("bc1")))
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

//            CategoryBookView()
//                .tabItem {
//                    Label("Library", systemImage: "books.vertical.fill")
//                }

            WishList(book:  Book(isbn:"r367216721t4781221",bookName: "The World Is Not Enough", bookAuthor: "By Jeremy Black", bookImage: Image("bc1")))
                .tabItem {
                    Label("Wishlist", systemImage: "heart.fill")
                }

            MyBooksView()
                .tabItem {
                    Label("My Books", systemImage: "book.fill")
                }

            MemberProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
