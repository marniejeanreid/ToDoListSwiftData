//
//  ContentView.swift
//  ToDoList
//
//  Created by scholar on 4/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var showNewTask = false
    
    @Query var toDos: [ToDoItem]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("ToDo List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                
                Spacer()
                
                Button {
                    withAnimation {
                        self.showNewTask = true
                    }
                    
                } label: {
                    Text("+")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                }
            }
            .padding()
            
            Spacer()
            
            List {
                ForEach(toDos) { toDoItem in
                    if toDoItem.isImportant == true {
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                    
                }
                .onDelete(perform: deleteToDo)
            }
            .listStyle(.plain)
            
        }
        if showNewTask {
            NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
        }
    }
    
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
}
