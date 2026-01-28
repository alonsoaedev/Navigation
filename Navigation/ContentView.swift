//
//  ContentView.swift
//  Navigation
//
//  Created by Alonso Acosta Enriquez on 27/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello world!")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap me!") {}
                        Button("Tap me too!") {}
                    }
                    
                    ToolbarItem(placement: .automatic) {
                        Button("Tap me x3") {}
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
