//
//  ItemModel.swift
//  TaskMe
//
//  Created by Benjamin. on 18/04/2025.
//

import Foundation
//
struct ItemModel: Identifiable,Codable {
    let id: String
    let task: String
    let isDone: Bool
    
    init(id: String?, task: String, isDone: Bool = false) {
        self.id = id ?? UUID().uuidString
        self.task = task
        self.isDone = isDone
    }
    
    //copywhith
    func copywith(task: String?, isDone: Bool?) -> ItemModel {
        return ItemModel(id: id,
                         task: task ?? self.task,
                         isDone: isDone ?? self.isDone
        )
    }
}

//
//class ItemModel: Identifiable,Codable {
//     var id: String
//     var task: String
//     var isDone: Bool
//    
//    init(id: String = UUID().uuidString,
//         task: String,
//         isDone: Bool = false) {
//        self.task = task
//        self.isDone = isDone
//        self.id = id
//    }
//    
//    func copyWith(
//        id: String?,
//        task: String?,
//        isDone: Bool?
//    ) -> ItemModel {
//        return ItemModel(
//            id: id ?? self.id,
//            task: task ?? self.task,
//            isDone: isDone ?? self.isDone
//        )
//    }
//    
//}
