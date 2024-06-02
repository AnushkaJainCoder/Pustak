//
//  IssueStruct.swift
//  Pustak
//
//  Created by apple on 01/06/24.
//

import Foundation

struct BookStatus{
    var approved: Bool
    var pending: Bool
    var bookName: String
    var approvedDate: Date
    var bookImage: String
    var issueDate: String?
    var authName: String
    var returnDate: String?
    
}

struct Member{
    var name: String
    var emailid: String
    var myBooks: [BookStatus]
    
}

struct requestedInfo{
    var BookImage: String
    var bookName: String
    var status: Bool
    var issueDate: String?
}

class MemberManager{
    var anushka: Member
//    var
    var myData: [BookStatus] = []
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        myData = [
                    BookStatus(approved: true, pending: false, bookName: "Games Of Thrones", approvedDate: Date(), bookImage: "bc1", authName: "ABC"),
                    BookStatus(approved: false, pending: true, bookName: "Games1 Of Thrones", approvedDate: dateFormatter.date(from: "2024/06/01") ?? Date(), bookImage: "bc1", authName: "ABC"),
                    BookStatus(approved: true, pending: false, bookName: "Games2 Of Thrones", approvedDate: dateFormatter.date(from: "2024/05/31") ?? Date(), bookImage: "bc1", authName: "ABC"),
                    BookStatus(approved: true, pending: false, bookName: "Games3 Of Thrones", approvedDate: dateFormatter.date(from: "2024/05/31") ?? Date(), bookImage: "bc1", authName: "ABC"),
                    BookStatus(approved: true, pending: false, bookName: "Games4 Of Thrones", approvedDate: dateFormatter.date(from: "2024/05/31") ?? Date(), bookImage: "bc1", authName: "ABC")
                ]
        myData.sort{$0.approvedDate > $1.approvedDate}
        anushka = Member(name: "Anushka Jain", emailid: "anu@gmail.com", myBooks: myData)
    }
    
    func displayRequested() -> [requestedInfo]{
        var rI: [requestedInfo] = []
        
        for bs in  anushka.myBooks{
            
       
          var newRequest = requestedInfo(BookImage:bs.bookImage, bookName: bs.bookName, status: bs.approved)
            rI.append(newRequest)
        }
        
        return rI
    }
    
    func addRequest(newBookDta: BookStatus) -> [BookStatus]{
        var rI: [BookStatus] = []
        var newBookData = BookStatus(approved: newBookDta.approved, pending: newBookDta.pending, bookName: newBookDta.bookName, approvedDate: newBookDta.approvedDate, bookImage: newBookDta.bookImage,  authName: newBookDta.authName)
        rI.append(newBookDta)
        return rI
    }
    
    func formattedDate(_ date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)

    }
//    func 
    func isToday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let currentDate = Date()
        print(currentDate)
        
        return calendar.isDateInToday(date)
        
    }
}
var m1 = MemberManager()
var myData = m1.myData
//m1.addRequest(newBookDta: <#T##BookStatus#>)

