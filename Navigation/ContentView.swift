//
//  ContentView.swift
//  Navigation
//
//  Created by Alonso Acosta Enriquez on 27/01/26.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    @Binding var path: [Int]
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1..<1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
//                    path = NavigationPath() // in case the NavigationPath is used
                }
            }
    }
}

struct ContentView: View {
    @State private var path: [Int] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { number in
                    DetailView(number: number, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
