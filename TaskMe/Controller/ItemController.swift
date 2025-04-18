//
//  ItemController.swift
//  TaskMe
//
//  Created by Benjamin. on 18/04/2025.
//

import Foundation

class ItemController: ObservableObject {
    @Published var items: [ItemModel] = []{
        didSet{
            saveData()
        }
    }
   private let itemsKey = "items_listt";
    
    
    init() {
        loadData()
    }
    
    func addTask(task:String){
        let newTask = ItemModel(id:nil,task: task, isDone: false)
        items.insert(newTask, at: 0)
    }
    
    func deleteTask(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func updateDone(item:ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            let newItem = item.copywith(task: nil, isDone: !item.isDone)
            items[index] = newItem
            //sort the items by isDone = false
            items.sort(by: { !$0.isDone && $1.isDone })
        }
    }
    
    func updateItem(item:ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item
        }
    }
    
   private func loadData(){
        if let data = UserDefaults.standard.data(forKey: itemsKey){
            if let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data){
                self.items = decodedData
            }
        }
    }
    
   private func saveData(){
        if let data = try? JSONEncoder().encode(items){
            UserDefaults.standard.setValue(data, forKey: itemsKey)
        }
    }
    
}
