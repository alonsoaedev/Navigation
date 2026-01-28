//
//  ContentView.swift
//  Navigation
//
//  Created by Alonso Acosta Enriquez on 27/01/26.
//

import SwiftUI

@Observable
class IntPathStore {
    private let savePath: URL = URL.documentsDirectory.appending(path: "SavedPath")
    
    var path: [Int] {
        didSet {
            save()
        }
    }
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }
        
        path = []
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save the navigation data")
        }
    }
}

@Observable
class NavigationPathPathStore {
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save the navigation data")
        }
    }
}

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
//    @State private var path: [Int] = []
    @State private var pathStore = IntPathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0, path: $pathStore.path)
                .navigationDestination(for: Int.self) { number in
                    DetailView(number: number, path: $pathStore.path)
                }
        }
    }
}

#Preview {
    ContentView()
}
