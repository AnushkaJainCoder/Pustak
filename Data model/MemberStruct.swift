import Foundation

struct BookStatus {
    var approved: Bool
    var pending: Bool
    var bookName: String
    var approvedDate: Date?
    var bookImage: String
    var issueDate: Date?
    var authName: String
    var returnDate: Date?
    var like: Bool
}

struct MemberProfile {
    let avatar: String
    let name: String
    let email: String
    let phone: String
    let library: String
    let contactEmail: String
    let contactPhone: String
    let fine: String
    var myBooks: [BookStatus]
}

struct RequestedInfo {
    var bookImage: String
    var bookName: String
    var status: Bool
    var issueDate: String?
    var returnDate: String?
}

class MemberManager: ObservableObject {
    var anushka: MemberProfile
    var myData: [BookStatus] = []
    @Published var wishList: [BookStatus] = []
//    @Pub  lished var wishList: [Book] = []
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        myData = [
            BookStatus(approved: true, pending: false, bookName: "Games Of Thrones", approvedDate: Date(), bookImage: "bc1", issueDate: dateFormatter.date(from: "2024/06/01") ?? Date(), authName: "ABC", returnDate: dateFormatter.date(from: "2024/06/10") ?? Date(), like: true),
            BookStatus(approved: false, pending: true, bookName: "Games1 Of Thrones", approvedDate: dateFormatter.date(from: "2024/06/01") ?? Date(), bookImage: "bc1", issueDate: dateFormatter.date(from: "2024/06/02") ?? Date(), authName: "ABC", returnDate: dateFormatter.date(from: "2024/06/11") ?? Date(), like: false),
            BookStatus(approved: true, pending: false, bookName: "Games2 Of Thrones", approvedDate: dateFormatter.date(from: "2024/05/31") ?? Date(), bookImage: "bc1", issueDate: dateFormatter.date(from: "2024/06/03") ?? Date(), authName: "ABC", returnDate: dateFormatter.date(from: "2024/06/12") ?? Date(), like: false),
            BookStatus(approved: true, pending: false, bookName: "Games3 Of Thrones", approvedDate: dateFormatter.date(from: "2024/05/31") ?? Date(), bookImage: "bc1", issueDate: dateFormatter.date(from: "2024/06/04") ?? Date(), authName: "ABC", returnDate: dateFormatter.date(from: "2024/06/13") ?? Date(), like: false),
            BookStatus(approved: true, pending: false, bookName: "Games4 Of Thrones", approvedDate: dateFormatter.date(from: "2024/05/31") ?? Date(), bookImage: "bc1", issueDate: dateFormatter.date(from: "2024/06/05") ?? Date(), authName: "ABC", returnDate: dateFormatter.date(from: "2024/06/14") ?? Date(), like: true)
        ]
        myData.sort { $0.approvedDate ?? Date() > $1.approvedDate ?? Date() }
        
        anushka = MemberProfile(
            avatar: "avatar.png",
            name: "Anushka Jain",
            email: "anu@gmail.com",
            phone: "123-456-7890",
            library: "Central Library",
            contactEmail: "contact@library.com",
            contactPhone: "098-765-4321",
            fine: "$10",
            myBooks: myData
        )
        addFavourite(book:  BookStatus(approved: true, pending: false, bookName: "Games Of Thrones", approvedDate: Date(), bookImage: "bc1", issueDate: dateFormatter.date(from: "2024/06/01") ?? Date(), authName: "ABC", returnDate: dateFormatter.date(from: "2024/06/10") ?? Date(), like: true)
        )
    }
    
    func displayRequested() -> [RequestedInfo] {
        var rI: [RequestedInfo] = []
        
        for bs in anushka.myBooks {
            let newRequest = RequestedInfo(bookImage: bs.bookImage, bookName: bs.bookName, status: bs.approved, issueDate: formattedDate(bs.issueDate), returnDate: formattedDate(bs.returnDate))
            rI.append(newRequest)
        }
        
        return rI
    }
    
    
    func addRequest(book: BookStatus)  {
//        var rI: [BookStatus] = []
//        rI.append(newBookData)
        myData.insert(book, at: 0)
        return
    }
    
    func formattedDate(_ date: Date?) -> String? {
        guard let date = date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    func isToday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(date)
    }
    
    func displayWishList() -> [BookStatus] {
        return wishList
    }
    
    func addFavourite(book: BookStatus) {
        wishList.insert(book, at: 0)
        print(wishList)
        return
    }
    
    func removeFavourite(bookName: String ) {
        if let index = wishList.firstIndex(where: { $0.bookName == bookName  }) {
            wishList.remove(at: index)
            objectWillChange.send()
            print("1234")
            print(wishList)
            return
        }
    }
}

var m1 = MemberManager()
var myData = m1.myData
var wish = m1.wishList

