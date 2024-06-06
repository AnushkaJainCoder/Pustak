import SwiftUI
struct MyBooksView: View{
    var col = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State private var selection = 0
    @State private var searchText = ""
    
    var body: some View{
        NavigationStack{
            ScrollView{
                VStack{
                    Picker(selection: $selection, label: Text("Picker")){
                        Text("Requested").tag(0)
                        Text("Issued").tag(1)
                        Text("Returned").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    switch selection {
                                        case 0:
                                            RequestedView()
                                        case 1:
                                            IssuedView()
                                        case 2:
                                            // ReturnedView()
                                            Text("Returned View")
                                        default:
                                            Text("Unknown selection")
                                        }
                }.navigationTitle("My Books")
            }
        }
        
    }
}

struct MyBooks_Preview: PreviewProvider{
    static var previews: some View{
        MyBooksView()
    }
}
