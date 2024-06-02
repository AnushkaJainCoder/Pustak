import Foundation
import SwiftUI

struct CategoryBookView: View {
    let authors = [
        ("Chetan Bhagat", "chetan"),
        ("Arundhati Roy", "arundhati"),
        ("Ruskin Bond", "ruskin"),
        ("Rabindranath", "ratag"),
        ("Chitra Banerjee", "chitra")
    ]

    let categories = [
        ("Fantasy", Gradient(colors: [Color(red: 233/255, green: 220/255, blue: 200/255), Color(red: 230/255, green: 226/255, blue: 217/255)])),
        ("Horror", Gradient(colors: [Color(red: 144/255, green: 0/255, blue: 32/255), Color(red: 79/255, green: 19/255, blue: 50/255)])),
        ("Adventure", Gradient(colors: [Color(red: 2/255, green: 128/255, blue: 144/255), Color(red: 0/255, green: 89/255, blue: 112/255)])),
        ("Romance", Gradient(colors: [Color(red: 255/255, green: 99/255, blue: 72/255), Color(red: 255/255, green: 158/255, blue: 0/255)])),
        ("Thriller", Gradient(colors: [Color(red: 54/255, green: 57/255, blue: 63/255), Color(red: 34/255, green: 40/255, blue: 49/255)])),
        ("Fiction", Gradient(colors: [Color(red: 116/255, green: 77/255, blue: 169/255), Color(red: 41/255, green: 128/255, blue: 185/255)])),
        ("Poetry", Gradient(colors: [Color(red: 252/255, green: 92/255, blue: 101/255), Color(red: 36/255, green: 37/255, blue: 42/255)])),
        ("Literature", Gradient(colors: [Color(red: 87/255, green: 117/255, blue: 144/255), Color(red: 39/255, green: 60/255, blue: 117/255)]))
    ]

    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Title with gradient background
//                Text("Find your book")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(
//                        LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue.opacity(0.3)]), startPoint: .leading, endPoint: .trailing)
//                    )
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                    .padding(.horizontal)
//                    .shadow(radius: 5)
                
                // Search bar
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                // Famous Authors section
//                Text("Famous Authors")
//                    .font(.title2)
//                    .fontWeight(.semibold)
//                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(authors, id: \.0) { author, imageName in
                            NavigationLink(destination: Text(author)) {
                                VStack {
                                    Circle()
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 80, height: 80)
                                        .overlay(
                                            Image(imageName)
                                                .resizable()
                                                .scaledToFill()
                                                .clipShape(Circle())
                                                .shadow(radius: 5)
                                        )
                                    Text(author)
                                        .fontWeight(.medium)
                                        .foregroundColor(.primary)
                                }
                                .padding(.horizontal, 5)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Browse Categories section
                Text("Browse Categories")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.leading, 20).padding(.top, 20)

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(categories, id: \.0) { category in
                            NavigationLink(destination: CategoryWiseBooks()) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(LinearGradient(gradient: category.1, startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(height: 100)
                                        .shadow(radius: 5)
                                    
                                    Text(category.0)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 10)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                }
                Spacer()
            }
            .navigationBarTitle("Categories")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
        }
        .padding(.horizontal, 10).padding(.top, 0 )
    }
}

struct ContentView1_Preview: PreviewProvider {
    static var previews: some View {
        CategoryBookView()
    }
}
