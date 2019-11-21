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
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newToDoItem
                            toDoItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            self.newToDoItem = " "
                        }){
                            Image(systemName: "plus.circle")
                            .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        }
                    }
                }
                Section(header: Text("To Do(s)")){
                    ForEach(self.toDoItems){
                        toDoItem in ToDoItemView(title: toDoItem.title!, createdAt: "\(toDoItem.createdAt!)")
                    }.onDelete {indexSet in
                        let deleteItem = self.toDoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do{
                            try self.managedObjectContext.save()
                        }
                        catch{
                            print(error)
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
