//import Foundation
//import SwiftUI
//
//struct Bookk: Identifiable {
//    let id = UUID()
//    let title: String
//    let author: String
//    let coverImage: String
//    let dateAdded: Date
//}
//
//struct MyBooks: View {
//    @State private var selectedTab: Int = 0
//    
//    @State private var reservedBooks: [Bookk] = []
//    @State private var issuedBooks: [Bookk] = []
//    
//    @State private var returnedBooks: [Bookk] = []
//    @State private var showAlert = false
//    @State private var bookToRemove: Bookk?
//    @State private var selectedReservedDate = Date()
//    
//    @State private var selectedIssuedDate = Date()
//    @State private var selectedReturnedDate = Date()
//    @State private var showDatePicker = false
//    
//    @State private var filterActiveReserved = false
//    @State private var filterActiveIssued = false
//    
//    @State private var filterActiveReturned = false
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Picker("", selection: $selectedTab) {
//                    Text("Reserved").tag(0)
//                    Text("Issued").tag(1)
//                    Text("Returned").tag(2)
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding()
//                
//                if showDatePicker {
//                    DatePicker(
//                        "Select Date",
//                        selection: Binding(
//                            get: {
//                                switch selectedTab {
//                                case 0: return self.selectedReservedDate
//                                case 1: return self.selectedIssuedDate
//                                default: return self.selectedReturnedDate
//                                }
//                            },
//                            set: { newDate in
//                                switch selectedTab {
//                                case 0:
//                                    self.selectedReservedDate = newDate
//                                    self.filterActiveReserved = true
//                                case 1:
//                                    self.selectedIssuedDate = newDate
//                                    self.filterActiveIssued = true
//                                default:
//                                    self.selectedReturnedDate = newDate
//                                    self.filterActiveReturned = true
//                                }
//                                self.showDatePicker = false
//                            }
//                        ),
//                        in: ...Date(),
//                        displayedComponents: .date
//                    )
//                    .datePickerStyle(GraphicalDatePickerStyle())
//                    .padding()
//                }
//                
//                ScrollView {
//                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
//                        if selectedTab == 0 {
//                            ForEach(filteredBooks(for: reservedBooks, filterActive: filterActiveReserved, selectedDate: selectedReservedDate)) { book in
//                                BookView(book: book, cancelAction: {
//                                    bookToRemove = book
//                                    showAlert = true
//                                })
//                            }
//                        } else if selectedTab == 1 {
//                            ForEach(filteredBooks(for: issuedBooks, filterActive: filterActiveIssued, selectedDate: selectedIssuedDate)) { book in
//                                BookView(book: book, cancelAction: nil)
//                            }
//                        } else if selectedTab == 2 {
//                            ForEach(filteredBooks(for: returnedBooks, filterActive: filterActiveReturned, selectedDate: selectedReturnedDate)) { book in
//                                BookView(book: book, cancelAction: nil)
//                            }
//                        }
//                    }
//                    .padding()
//                }
//            }
//            .navigationBarTitle("My Books")
//            .navigationBarItems(trailing: Menu {
//                Button(action: {
//                    showDatePicker.toggle()
//                }) {
//                    Label("Select Date", systemImage: "calendar")
//                }
//            } label: {
//                Image(systemName: "line.horizontal.3.decrease.circle")
//                    .imageScale(.large)
//            })
//            .onAppear(perform: fetchBooks)
//            .alert(isPresented: $showAlert) {
//                Alert(
//                    title: Text("Cancel Reservation"),
//                    message: Text("Your reservation will be canceled."),
//                    primaryButton: .destructive(Text("OK")) {
//                        if let book = bookToRemove {
//                            reservedBooks.removeAll { $0.id == book.id }
//                            bookToRemove = nil
//                        }
//                    },
//                    secondaryButton: .cancel()
//                )
//            }
//        }
//    }
//    
//    // Dummy data
//    
//    private func fetchBooks() {
//        
//        reservedBooks = [
//            Bookk(title: "Elon Musk", author: "Ashlee Vance", coverImage: "elon", dateAdded: Date(timeIntervalSinceNow: -86400 * 1)),
//            Bookk(title: "Think & Grow Rich", author: "Napoleon Hill", coverImage: "think_and_grow_rich", dateAdded: Date(timeIntervalSinceNow: -86400 * 2)),
//            Bookk(title: "The Magic of the Lost Temple", author: "Sudha Murthy", coverImage: "magic_of_the_lost_temple", dateAdded: Date(timeIntervalSinceNow: -86400 * 3)),
//            Bookk(title: "The Power of Your Subconscious Mind", author: "Joseph Murphy", coverImage: "power_of_your_subconscious_mind", dateAdded: Date(timeIntervalSinceNow: -86400 * 4)),
//            Bookk(title: "How to Win Friends and Influence People", author: "Dale Carnegie", coverImage: "how_to_win_friends", dateAdded: Date(timeIntervalSinceNow: -86400 * 5)),
//            Bookk(title: "Wings of Fire", author: "A.P.J. Abdul Kalam", coverImage: "wings_of_fire", dateAdded: Date(timeIntervalSinceNow: -86400 * 6))
//        ]
//        
//        issuedBooks = [
//            Bookk(title: "Book 6", author: "Author 6", coverImage: "book6", dateAdded: Date(timeIntervalSinceNow: -86400 * 1)),
//            Bookk(title: "Book 7", author: "Author 7", coverImage: "book7", dateAdded: Date(timeIntervalSinceNow: -86400 * 2))
//        ]
//        
//        returnedBooks = [
//            Bookk(title: "Book 8", author: "Author 8", coverImage: "book8", dateAdded: Date(timeIntervalSinceNow: -86400 * 1)),
//            Bookk(title: "Book 9", author: "Author 9", coverImage: "book9", dateAdded: Date(timeIntervalSinceNow: -86400 * 2))
//        ]
//    }
//    
//    private func filteredBooks(for books: [Bookk], filterActive: Bool, selectedDate: Date) -> [Bookk] {
//        if filterActive {
//            return books.filter { $0.dateAdded >= selectedDate }
//        } else {
//            return books
//        }
//    }
//}
//
//struct BookView: View {
//    let book: Bookk
//    let cancelAction: (() -> Void)?
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            ZStack(alignment: .topTrailing) {
//                Image(book.coverImage)
//                    .resizable()
//                    .frame(width: 150, height: 200)
//                    .cornerRadius(8)
//                if let cancelAction = cancelAction {
//                    Menu {
//                        Button(action: cancelAction)
//                        {
//                            Label("Cancel Reservation", systemImage: "xmark.circle")
//                        }
//                                            } label: {
//                                                Image(systemName: "ellipsis")
//                                                    .padding(8)
//                                                    .background(Color.black.opacity(0.5))
//                                                    .clipShape(Circle())
//                                                    .foregroundColor(.white)
//                                                    .padding(8)
//                                            }
//                                        }
//                                    }
//                                    Text(book.title)
//                                        .font(.headline)
//                                        .lineLimit(1)
//                                        .frame(width: 150, alignment: .leading)
//                                    Text("By \(book.author)")
//                                        .font(.subheadline)
//                                        .foregroundColor(.gray)
//                                        .frame(width: 150, alignment: .leading)
//                                }
//                                .frame(width: 150)
//                            }
//                        }
//
//struct ContentView_Preview: PreviewProvider {
//                            static var previews: some View {
//                                MyBooks()
//                            }
//                        }


import SwiftUI
struct MyBooksView: View{
//    let reservedBooks: [Book] = [
//    Book(isbn: "1234567890", bookName: "Think & Grow Rich", bookAuthor: "Napoleon Hill", bookImage: Image("think_and_grow_rich")),
//    Book(isbn: "1234567891", bookName: "The Magic of the Lost Temple", bookAuthor: "Sudha Murthy", bookImage: Image("magic_of_the_lost_temple")),
//    Book(isbn: "1234567892", bookName: "The Power of Your Subconscious Mind", bookAuthor: "Joseph Murphy", bookImage: Image("power_of_your_subconscious_mind")),
//    Book(isbn: "1234567893", bookName: "How to Win Friends and Influence People", bookAuthor: "Dale Carnegie", bookImage: Image("how_to_win_friends")),
//    Book(isbn: "1234567894", bookName: "Wings of Fire", bookAuthor: "A.P.J. Abdul Kalam", bookImage: Image("wings_of_fire"))]
    
    var col = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State private var selection = 0
    @State private var searchText = ""
    
    var body: some View{
        NavigationView{
            ScrollView{
            VStack{
                Picker(selection: $selection, label: Text("Picker")){
                    Text("Requested").tag(0)
                    
                    
                    Text("Issued").tag(1)
                    Text("Returned").tag(2)
                }
                .pickerStyle(.segmented)
                .padding()
                if(selection == 0){
                    RequestedView()
                }
                //        else if(selection == 1){
                //
                //        }
                //        else if(selection == 2){
                //
                //        }
                
                
            }.navigationTitle("My Books")
        }
    }
    
}

    struct RequestedView: View{
        @State private var selection = 0
        var body: some View{
            //        NavigationView{
            ScrollView(.vertical){
                
                HStack{
                    
                    
                }
                HStack{
                    Text("History").font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.leading, 10)
                    Spacer()
                    Picker( selection: $selection, label: Text("Picker")){
                        Text("All").tag(0).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.leading, 20)
                        Text("Today").tag(1).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Pending").tag(2)
                        
                    }
//                    Spacer()
                }.padding(.leading, 10)
                
                if(selection == 0){
//                    HStack{
//                        
//                        Text("History").font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.leading, 20)
//                        Spacer()
//                    }
                    ForEach(myData, id:\.bookName) { data in
                        //                if(data.approvedDate == )
                        HStack{
                            VStack(alignment: .leading){
                                Image(data.bookImage).resizable().frame(width: 80, height: 130)
                                
                                
                            }.padding(.leading, 20)
                            VStack{
                                Spacer()
                                VStack(alignment: .leading){
                                    Text(data.bookName).font(.title3).fontWeight(.semibold)
                                    Text("~ \(data.authName)").font(.caption).padding(.bottom, 5).foregroundColor(.gray)
                                    HStack{
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                                            if(data.approved == true){
                                                Text("Accepted").foregroundColor(.green).font(.subheadline)
                                            }
                                            else{
                                                Text("Pending").foregroundColor(.orange).font(.subheadline)
                                            }
                                        }.padding(EdgeInsets(top: 5, leading: 6, bottom: 5, trailing: 6)).background(LinearGradient(
                                            gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )).cornerRadius(9)
                                        if(data.approved == true){
                                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                                                
                                                Text( m1.formattedDate(data.approvedDate)).font(.subheadline)
                                                
                                            }.padding(EdgeInsets(top: 5, leading: 6, bottom: 5, trailing: 6)).background(LinearGradient(
                                                gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )).cornerRadius(9)
                                        }
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                
                            }.frame(width: 200,height: 100 ).padding(.leading, 10).padding(.trailing, 50).background(LinearGradient(
                                gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )).cornerRadius(9)
                            Spacer()
                        }
                    }
                }
                else if(selection == 1){
                    
                    ForEach(myData.filter{m1.isToday($0.approvedDate) }, id:\.bookName) { data in
                        //                if(data.approvedDate == )
                        HStack{
                            VStack(alignment: .leading){
                                Image(data.bookImage).resizable().frame(width: 80, height: 130)
                                
                                
                            }.padding(.leading, 20)
                            VStack{
                                Spacer()
                                VStack(alignment: .leading){
                                    Text(data.bookName).font(.title3).fontWeight(.semibold)
                                    Text("~ \(data.authName)").font(.caption).padding(.bottom, 5).foregroundColor(.gray)
                                    HStack{
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                                            if(data.approved == true){
                                                Text("Accepted").foregroundColor(.green).font(.subheadline)
                                            }
                                            else{
                                                Text("Pending").foregroundColor(.orange).font(.subheadline)
                                            }
                                        }.padding(EdgeInsets(top: 5, leading: 6, bottom: 5, trailing: 6)).background(LinearGradient(
                                            gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )).cornerRadius(9)
                                        if(data.approved == true){
                                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                                                
                                                Text( m1.formattedDate(data.approvedDate)).font(.subheadline)
                                                
                                            }.padding(EdgeInsets(top: 5, leading: 6, bottom: 5, trailing: 6)).background(LinearGradient(
                                                gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )).cornerRadius(9)
                                        }
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                
                            }.frame(width: 200,height: 100 ).padding(.leading, 10).padding(.trailing, 50).background(LinearGradient(
                                gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )).cornerRadius(9)
                            Spacer()
                        }
                    }
                
                    }
                    
                
                
                else if(selection == 2){
//
                    ForEach(myData.filter{$0.pending}, id:\.bookName) { data in
                        //                if(data.approvedDate == )
                        HStack{
                            VStack(alignment: .leading){
                                Image(data.bookImage).resizable().frame(width: 80, height: 130)
                                
                                
                            }.padding(.leading, 20)
                            VStack{
                                Spacer()
                                VStack(alignment: .leading){
                                    Text(data.bookName).font(.title3).fontWeight(.semibold)
                                    Text("~ \(data.authName)").font(.caption).padding(.bottom, 5).foregroundColor(.gray)
                                    HStack{
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                                            if(data.approved == true){
                                                Text("Accepted").foregroundColor(.green).font(.subheadline)
                                            }
                                            else{
                                                Text("Pending").foregroundColor(.orange).font(.subheadline)
                                            }
                                        }.padding(EdgeInsets(top: 5, leading: 6, bottom: 5, trailing: 6)).background(LinearGradient(
                                            gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )).cornerRadius(9)
                                        if(data.approved == true){
                                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                                                
                                                Text( m1.formattedDate(data.approvedDate)).font(.subheadline)
                                                
                                            }.padding(EdgeInsets(top: 5, leading: 6, bottom: 5, trailing: 6)).background(LinearGradient(
                                                gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )).cornerRadius(9)
                                        }
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                
                            }.frame(width: 200,height: 100 ).padding(.leading, 10).padding(.trailing, 50).background(LinearGradient(
                                gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )).cornerRadius(9)
                            Spacer()
                        }
                    }
                
                    
                }
            }
            
        }
        
    }
}

//struct IssuedView: View{
//    var body: some View{
//        
//    }
//}
//
//struct ReturnedView: View{
//    var body: some View{
//
//    }
//}


struct MyBooks_Preview: PreviewProvider{
    static var previews: some View{
        MyBooksView()
    }
}
