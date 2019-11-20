//
//  ToDoItem.swift
//  ToDoCoredataSwiftUI
//
//  Created by Mike  Van Amburg on 11/20/19.
//  Copyright © 2019 Mike Van Amburg. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem: NSManagedObject, Identifiable{
    @NSManaged public var createAt:Date?
    @NSManaged public var title:String?
}

extension ToDoItem {
    static func getAllToDoItems()-> NSFetchRequest<ToDoItem>{
        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
