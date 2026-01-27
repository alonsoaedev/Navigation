//
//  ContentView.swift
//  Navigation
//
//  Created by Alonso Acosta Enriquez on 27/01/26.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    let name: String
    let age: Int
}

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
                NavigationLink("Select \(i)", value: i)
                NavigationLink("Estudiante", value: Student(name: "Alonso", age: 30))
            }
            .navigationDestination(for: Int.self) { selection in
                // Now this view will only created when the NavigationLink attached
                // to the Integer had been tapped
                DetailView(number: selection)
            }
            .navigationDestination(for: Student.self) { student in
                // Same here, this view will be loaded only on screen when the NavigationLink
                // attached to the Student type had been tapped
                Text("Hello, \(student.name)")
            }
        }
    }
}

#Preview {
    ContentView()
}
