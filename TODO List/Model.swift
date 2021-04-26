//
//  Model.Swift
//  TODO List
//
//  Created by Анастасия on 11.02.2021.
//  Copyright © 2021 Nasty. All rights reserved.
//

import Foundation

var ToDoItems : [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
    UserDefaults.standard.synchronize()
        
    }

   get {
     if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
           return array
       } else {
     return []
       }
    }
}


func addItem(nameItem: String, isCompleted: Bool = false) {
    ToDoItems.append(["Name": nameItem, "isCompleted": false])
 
}

func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
}
    func moveItem(fromIndex: Int, toIndex: Int) {
        let from = ToDoItems[fromIndex]
        ToDoItems.remove(at: fromIndex)
        ToDoItems.insert(from, at: toIndex)
    }
    
    

func changeState (at item : Int) -> Bool {
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
 return ToDoItems[item]["isCompleted"] as! Bool
}

