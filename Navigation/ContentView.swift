//
//  ContentView.swift
//  Navigation
//
//  Created by Alonso Acosta Enriquez on 27/01/26.
//

import SwiftUI

struct DetailView: View {
    let number: Int
    
    var body: some View {
        Text("Detail for \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<1000) { i in
                NavigationLink("Tap me") {
                    // What will happen is that just by showing the NavigationLink
                    // on the screen it's enough for SwiftUI to automatically create
                    // the detail view inside it. This is a problem when we have dynamic data
                    DetailView(number: i)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
