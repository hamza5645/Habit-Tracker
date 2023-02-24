//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Hamza Osama on 24/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var listItems = [ListItem]()
    @State private var isAddingItem = false
    @State private var title = ""
    @State private var descriptions = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listItems) { item in
                    Text(item.title)
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddingItem = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingItem) {
                NavigationView {
                    Form {
                        TextField("Title", text: $title)
                        TextField("description", text: $descriptions)
                    }
                    .navigationTitle("New Item")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Save") {
                                let newItem = ListItem(title: title, description: descriptions)
                                listItems.append(newItem)
                                isAddingItem = false
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ListItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
