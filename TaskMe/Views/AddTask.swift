//
//  AddTask.swift
//  TaskMe
//
//  Created by Benjamin. on 18/04/2025.
//

import SwiftUI

struct AddTask: View {
    
    @State var text: String = ""
    var item: ItemModel?
    @EnvironmentObject var itemController: ItemController
    @Environment(\.presentationMode) var pM
    @State var showAlert:Bool = false
    @State var alertTitle:String = ""
    
    var body: some View {
        VStack{
            TextField("Enter your task", text: $text)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.vertical)
            Button {
                // Save the task
                if(checkText()){
                    if item != nil {
                        itemController.updateItem(item: item!.copywith(task: text, isDone: false))
                    }else {
                        itemController.addTask(task: text)
                    }
                    pM.wrappedValue.dismiss()
                }
            } label: {
                Text(item != nil ? "Update Task" : "Save Task")
                    .foregroundStyle(Color.appWhite)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .padding(.horizontal)
        .navigationTitle(item != nil ?"Edit Task 🖊️": "Add New Task 🥳")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertTitle),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear {
            if let item = item {
                text = item.task
            }
        }
    }
    
    func checkText() -> Bool {
        if text.isEmpty {
            alertTitle = "Please enter a task"
            showAlert.toggle()
            return false
        }
        if text.count<3 {
            alertTitle = "Task length is too short"
            showAlert.toggle()
            return false
        }
        if text.count > 150 {
            alertTitle = "Task length is too long"
            showAlert.toggle()
            return false
        }
        return true
    }
}

#Preview {
    NavigationView{
        AddTask()
    }
    .environmentObject(ItemController())
}
