//
//  TaskMeApp.swift
//  TaskMe
//
//  Created by Benjamin. on 18/04/2025.
//

import SwiftUI

@main
struct TaskMeApp: App {
    @StateObject var itemController = ItemController()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                Home()      
            }
            .navigationViewStyle(.stack)
            .environmentObject(itemController)
        }
    }
}
