//
//  ContentView.swift
//  gymJournal
//
//  Created by Alexandra Roszczenko on 2025-03-01.
//

import SwiftUI


struct ContentView: View {
    @State private var searchQuery = ""  // State for search query
    let items: [Item] = [
        Item(title: "Page 1", imageName: "deadlift", destination: AnyView(Page1View())),
        Item(title: "Page 2", destination: AnyView(Page2View())),
        Item(title: "Page 3", destination: AnyView(Page3View())),
        Item(title: "Page 4", destination: AnyView(Page1View())),
        Item(title: "Page 5", destination: AnyView(Page2View())),
        Item(title: "Page 6", destination: AnyView(Page3View()))
    ]
    
    // Filter items based on search query
    var filteredItems: [Item] {
        if searchQuery.isEmpty {
            return items  // If search is empty, show all items
        } else {
            return items.filter { $0.title.lowercased().contains(searchQuery.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar at the top with clear button
                HStack {
                    TextField("Search", text: $searchQuery)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    // Clear search button, only shows when there is text in the search bar
                    if !searchQuery.isEmpty {
                        Button(action: {
                            searchQuery = ""  // Clear the search query
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                        }
                    }
                }
                
                // Scrollable list of filtered items
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(filteredItems) { item in
                            NavigationLink(destination: item.destination) {
                                HStack {
                                    if let imageName = item.imageName {
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                    }
                                    Text(item.title)
                                        .frame(maxWidth: .infinity)
                                }
                            
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
            }
            .navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

