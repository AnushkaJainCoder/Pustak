////
////  Book.swift
////  Pustak
////
////  Created by apple on 04/06/24.
////
//
//import Foundation
//import SwiftUI
//
//struct Book {
//    let isbn:String
//    let bookName: String
//    let bookAuthor: String
//    let bookImage: Image
//    let summary: String
//    let issueCount: Int
//    let genre: String
//}
//
//class BookManager{
//    var books: [Book] = []
//    var trendyBooks: [Book] = []
//    init() {
//        books = [
//            Book(isbn: "r367216721t478121", bookName: "The World Is Not Enough", bookAuthor: "By Jeremy Black", bookImage: Image("bc1"), summary: "ABC", issueCount: 0, genre: "fantasy"),
//            Book(isbn:"r367216721t47821",bookName: "Reign Of Terror", bookAuthor: "By Spencer Ackerman", bookImage: Image("bc1"), summary: "ABX", issueCount: 20, genre: "horror"),
//            Book(isbn:"r367216721t478121",bookName: "Harry Potter Part2", bookAuthor: "By JK Rawling", bookImage: Image("bc1"), summary: "poi", issueCount: 14, genre: "adventure"),
//            Book(isbn:"r367216721t47821",bookName: "Cold Blooded Love", bookAuthor: "By Spencer ", bookImage: Image("bc1"), summary: "yui", issueCount: 10, genre: "fantasy"),
//            Book(isbn:"r367216721t4781221",bookName: "The World Is Not Enough", bookAuthor: "By Jeremy Black", bookImage: Image("bc1"), summary: "qwe", issueCount: 23, genre: "fantasy"),
//            Book(isbn:"r3672167211t47821",bookName: "The Known World", bookAuthor: "By Spencer Ackerman", bookImage: Image("bc1"), summary: "hello", issueCount: 30, genre: "fiction")
//        ]
//    }
//    func trendy() -> [Book]{
//       
//       
//        return books.sorted{$0.issueCount > $1.issueCount}
//        
//    }
//    
//    func suggested() -> [Book]{
//        trendyBooks = books.sorted{$0.issueCount > $1.issueCount}
//        return Array(trendyBooks.prefix(3))
//        
//    }
//    
//    func displayGenreBook(genreType: String) -> [Book]{
//        var filterBooks: [Book] = []
//        for book in books{
//            if book.genre == genreType{
//                filterBooks.append(book)
//                
//            }
//        }
//        return filterBooks
//    }
//    func displayAuthorBook(bookAuthor: String) -> [Book]{
//        var filterBooks: [Book] = []
//        for book in books{
//            if book.bookAuthor == bookAuthor{
//                filterBooks.append(book)
//                
//            }
//        }
//        return filterBooks
//    }
//}
//
//var b1 = new BookManager()
//
