//
//  ContentView.swift
//  gymJournal
//
//  Created by Alexandra Roszczenko on 2025-03-01.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    let items: [Item<some View>] = [
        Item(title: "Page 1", destination: Page1View()),
        Item(title: "Page 2", destination: Page2View()),
        Item(title: "Page 3", destination: Page3View()),
        Item(title: "Page 4", destination: Page1View()), // More items for scrolling
        Item(title: "Page 5", destination: Page2View()),
        Item(title: "Page 6", destination: Page3View())
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
