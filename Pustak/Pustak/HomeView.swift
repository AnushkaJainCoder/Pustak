//
//  HomeView.swift
//  Pustak
//
//  Created by apple on 30/05/24.
//

import Foundation
import SwiftUI

struct Book {
    let isbn:String
    let bookName: String
    let bookAuthor: String
    let bookImage: Image
}


struct HomeView: View{
    let continueReading = [
                    Book(isbn:"r367216721t478121",bookName: "The World Is Not Enough", bookAuthor: "By Jeremy Black", bookImage: Image("c2")),
        Book(isbn:"r367216721t47821",bookName: "Reign Of Terror", bookAuthor: "By Spencer Ackerman", bookImage: Image("c3"))
    ]
    let trendingItems = [
        Book(isbn:"r367216721t478121",bookName: "Harry Potter Part2", bookAuthor: "By JK Rawling", bookImage: Image("t4")),
Book(isbn:"r367216721t47821",bookName: "Cold Blooded Love", bookAuthor: "By Spencer ", bookImage: Image("t1")),
        Book(isbn:"r367216721t4781221",bookName: "The World Is Not Enough", bookAuthor: "By Jeremy Black", bookImage: Image("c2")),
Book(isbn:"r3672167211t47821",bookName: "The Known World", bookAuthor: "By Spencer Ackerman", bookImage: Image("t6"))
        ]
    
    
    let reqItems = [
        Book(isbn:"r367216721t478121",bookName: "The Ruskin Bond Part2", bookAuthor: "By JK Rawling", bookImage: Image("t2")),
//Book(/*isbn:"r367216721t47821",bookName: "Cold Blooded Love", bookAuthor: "By Spencer ", bookImage: Image("t1")),*/
//        Book(isbn:"r367216721t4781221",bookName: "The World Is Not Enough", bookAuthor: "By Jeremy Black", bookImage: Image("c2")),
//Book(isbn:"r3672167211t47821",bookName: "The Known World", bookAuthor: "By Spencer Ackerman", bookImage: Image("t6"))
        ]
    @State private var centerIndex : Int? = nil
    
    
    var body: some View{
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    
                    ScrollView(.horizontal,showsIndicators: false)
                    {
                        HStack(spacing:20)
                        {
                            ForEach(continueReading,id:\.isbn)
                            {
                                book in
                                VStack(alignment: .leading){
                                    
                                    book.bookImage
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width: 130,height: 200)
                                        .cornerRadius(15)
                                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                }
                                VStack(alignment: .leading){
                                    Text(book.bookName)
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).lineLimit(nil).fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    
                                    Text(book.bookAuthor)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .padding(.bottom)
                                    
                                    Button(action: {} ){Text("Issue")
                                            .font(.subheadline)
                                        .frame(alignment: .center)}
                                    //                                .padding(.top)
                                    .frame(maxWidth:.infinity)
                                    .frame(height: 40)
                                    .background(Color(red: 233 / 255, green: 220 / 255, blue: 200 / 255))
                                    .cornerRadius(15)
                                    .foregroundColor(.black)
                                    
                                }.frame(width: 200)
                            }
                        }.padding(EdgeInsets(top: 20,leading: 10, bottom: 20, trailing: 20))
                        
                        
                        
                        
                        
                    }
                  
                    Text("Trendy").font(.title2).padding(.leading)
                            
                    
                    ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20){
                        ForEach(Array(trendingItems.enumerated()), id: \.1.isbn) { index,book in
//                            GeometryReader{ geo in
                                VStack(alignment: .leading){
                                    book.bookImage.resizable().frame(width: index == centerIndex ? 150 : 100, height: index == centerIndex ? 225 : 150).aspectRatio(contentMode: .fill).cornerRadius(9)
                                    Text(book.bookName).font(.system(size:  index == centerIndex ? 20 : 15, weight: .bold)).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).lineLimit(nil).fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    Text(book.bookAuthor).font(.system(size: index == centerIndex ? 12 : 7 )).foregroundColor(.gray).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).lineLimit(nil).fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                }.frame(width: index == centerIndex ? 150 : 100, height: index == centerIndex ? 250 : 200)
//                                .onChange(of: geo.frame(in: .global).midX) { newValue in
//                                    updateCenterIndex(with: geo.frame(in: .global).midX, index: index)
//                                }
                            }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
                    }.padding(.leading)
                        
                    }.padding(.bottom)
                    
                    
                    HStack{
                        Text("Requests").font(.title2)
                        Spacer()
                        Button(action: {}){
                            Text("See All").font(.caption2).foregroundColor(.gray)
                        }
                    }.padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        VStack(alignment: .leading,spacing: 10){
                            ForEach(reqItems, id: \.isbn) { item in
                                HStack(spacing: 20){
//
                                    VStack(alignment: .leading){
                                        item.bookImage.resizable().frame(width: 70, height: 100).aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).cornerRadius(9)
                                    }
                                    VStack(alignment: .leading, spacing: 5){
                                        Text(item.bookName).font(.title3).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).lineLimit(nil).fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        Text(item.bookAuthor).font(.caption).foregroundColor(.gray).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).lineLimit(nil).fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        Text("Accepted").font(.caption2).foregroundColor(.green)
                                        Text("Fine: 20Rs").font(.caption2).foregroundColor(.red)

                                    }.frame(width: 230).padding(.leading).padding(.trailing)
//                                    VStack(alignment: .leading){
//                                        Text("No Dues").font(.title3).foregroundColor(.yellow)
//                                    }
                                }.padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 0)).cornerRadius(9).background(Color(red: 233 / 255, green: 220 / 255, blue: 200 / 255)).frame(width: 300)
//
                            }
                        }.padding(EdgeInsets(top: 0, leading: 49, bottom: 0, trailing: 49)).cornerRadius(9)
                    }
                    
                    
                    
                }}.navigationTitle("Pustak")
            }
        }
        
    
    
//    private func updateCenterIndex(geo: GeometryProxy, index: Int) {
//            let screenWidth = UIScreen.maain.bounds.width
//            let screenCenterX = screenWidth / 2
//            let itemMidX = geo.frame(in: .global).midX
//            let distance = abs(itemMidX - screenCenterX)
//            
//            if centerIndex == nil || distance < abs(trendingItems[centerIndex!].id.uuidString.hashValue - screenCenterX) {
//                centerIndex = index
//            }
//        }
    }
    
    
    
struct HomeView_Preview: PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}

