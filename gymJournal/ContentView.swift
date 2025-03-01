//
//  ContentView.swift
//  gymJournal
//
//  Created by Alexandra Roszczenko on 2025-03-01.
//

import SwiftUI
// import SwiftData

struct ContentView: View {
    // An array of `Item` objects with wrapped destination views (type-erased with `AnyView`).
    let items: [Item] = [
        Item(title: "Page 1", destination: AnyView(Page1View())),
        Item(title: "Page 2", destination: AnyView(Page2View())),
        Item(title: "Page 3", destination: AnyView(Page3View())),
        Item(title: "Page 4", destination: AnyView(Page1View())),
        Item(title: "Page 5", destination: AnyView(Page2View())),
        Item(title: "Page 6", destination: AnyView(Page3View()))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(items) { item in
                        NavigationLink(destination: item.destination) {
                            Text(item.title)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 10)
            }
            .navigationTitle("Main Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

