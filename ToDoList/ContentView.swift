//
//  ContentView.swift
//  ToDoList
//
//  Created by scholar on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showNewTask = false
    
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
            
        }
        if showNewTask {
            NewToDoView()
        }
    }
}

#Preview {
    ContentView()
}
