import SwiftUI

struct LibraryIssueCard: View {
    var bookName = "Harry Potter"
    var authName = "Jonathan Harry"
    var user = "Anushka Jain"
    var id = 123
    
    var body: some View {
        HStack {
            BookCover(bookName: bookName, authName: authName, width: 100, height: 150, BnamefontType: .title2)
                .cornerRadius(10)
                .shadow(radius: 5)
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text(bookName)
                    .font(.title)
                    .foregroundColor(.black)
                Text("by \(authName)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                VStack(alignment:.trailing){
                Text("Issued: \(user)")
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
                Text("(211099024)")
                    .font(.subheadline)
                    .foregroundColor(.accentColor).padding(.leading,54)
                }
            }.padding()
        }
        .padding().frame(width: 340,height: 180)
        .background(Gradient(colors: [Color(red: 233/255, green: 220/255, blue: 200/255), Color(red: 230/255, green: 226/255, blue: 217/255)]))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct LibraryIssueCard_Previews: PreviewProvider {
    static var previews: some View {
        LibraryIssueCard()
    }
}
