//
//  ContentView.swift
//  ToDoCoredataSwiftUI
//
//  Created by Mike  Van Amburg on 11/20/19.
//  Copyright © 2019 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   //acessing data
    @Environment(\.managedObjectContext)
    var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems())
    var toDoItems:FetchedResults<ToDoItem>
    
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Add a ToDo")){
                    HStack{
                        TextField("new ToDo..", text: self.$newToDoItem)
                        Button(action: {
                            
                        }){
                            Image(systemName: "plus.circle")
                            .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
            .accentColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
