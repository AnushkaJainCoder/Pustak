import SwiftUI
import Charts


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
                WishList().tabItem {
                    Image(systemName: "heart.fill")
                    Text("Wishlist")
                }
                MyBooksView().tabItem{
                    Image(systemName: "book.fill")
                    Text("My Books")
                }
                
                MemberProfileView().tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            }
    }
}



#Preview {
    ContentView()
}


//struct ToyShop: Identifiable{
//    var count: Double
//    var type: String
//    var id = UUID()
//}
//func Area(for_radius r:Double)->Double
//{
//    return (22*r*r)/7.0
//}

//var bookName = "Ugly Love"
//var authName = "Coolen Hoover"
//var data: [ToyShop] = [
//    .init(count: 5, type: "Cube")
//    , .init(count: 1, type: "Sphere")
//    , .init(count: 3, type: "Triangle")
//    , .init(count: 4, type: "Pen")
//    , .init(count: 9, type: "dhfje")
//    
//]
//var body: some View{
////            BookCover(bookName: bookName, authName: authName)
////
//    
//    var a = Area(for_radius: 4)
//    Chart{
//        BarMark(
//            x: .value("Shape Type", data[0].type),
//            y: .value("Total count", data[0].count)
//        )
//        BarMark(
//            x: .value("Shape Type", data[1].type),
//            y: .value("Total count", data[1].count)
//        )
//        BarMark(
//            x: .value("Shape Type", data[2].type),
//            y: .value("Total count", data[2].count)
//        )
//    }
//}
