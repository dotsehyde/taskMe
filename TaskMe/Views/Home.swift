//
//  Home.swift
//  TaskMe
//
//  Created by Benjamin. on 18/04/2025.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var itemController: ItemController
    var body: some View {
       
            ZStack{
                if itemController.items.isEmpty{
                    NoItems()
                        .transition(
                            AnyTransition(.slide).animation(.easeIn)
                        )
                }else{
                    List{
                        ForEach(itemController.items){ item in
                            NavigationLink {
                                AddTask(item: item)
                            } label: {
                                ListRowView(item: item)
                                      .padding(.vertical,8)
                                      .swipeActions(edge: .leading) {
                                            Button {
                                                withAnimation {
                                                    itemController.updateDone(item: item)
                                                }
                                            } label: {
                                                if item.isDone{
                                                    Label("Undo", systemImage: "arrow.uturn.backward")
                                                        .background(.red)
                                                }else{
                                                    Label("Done", systemImage: "checkmark")
                                                        .background(.green)
                                                }
                                            }
                                      }
                            }
                        }
                        .onDelete(perform: itemController.deleteTask)
                        .onMove(perform: itemController.moveTask)
                        
                    }
                    .listStyle(PlainListStyle())
                
            }
        }
        .navigationTitle("TaskMe 📝")
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing){
                NavigationLink("Add") {
                    AddTask()
                }
            }
        }
    }
        
}
struct ListRowView: View {
    var item: ItemModel
    @EnvironmentObject var itemController: ItemController
    var body: some View {
        VStack {
            HStack{
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(item.isDone ? .green : .red)
                    .font(.title2)
                    .padding(.trailing, 10)
                Text(item.task)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
              

            }
           
        }
    }
}

#Preview {
    NavigationView {
        Home()
    }
    .environmentObject(ItemController())
}
