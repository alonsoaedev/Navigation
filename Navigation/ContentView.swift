//
//  ContentView.swift
//  Navigation
//
//  Created by Alonso Acosta Enriquez on 27/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline) // check the canvas
        }
    }
}

#Preview {
    ContentView()
}
