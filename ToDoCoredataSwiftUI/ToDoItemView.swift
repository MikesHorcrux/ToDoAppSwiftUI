//
//  ToDoItemView.swift
//  ToDoCoredataSwiftUI
//
//  Created by Mike  Van Amburg on 11/20/19.
//  Copyright © 2019 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(title)
                Text(createdAt)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView()
    }
}
