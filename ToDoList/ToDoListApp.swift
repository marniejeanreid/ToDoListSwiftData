//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by scholar on 4/17/24. 💚
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
