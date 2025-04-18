//
//  NoItems.swift
//  TaskMe
//
//  Created by Benjamin. on 18/04/2025.
//

import SwiftUI

struct NoItems: View {
    @State var animateForever: Bool = false
    @State var animateOnce: Bool = false
    var body: some View {
        VStack(alignment: .center,spacing: 10){
                Image(systemName: "pencil.and.list.clipboard")
                    .font(.system(size: 70, weight: .semibold))
                    .offset(y:animateOnce ? 0 : 20)
                    .opacity(animateOnce ? 1 : 0)
                    
                Text("No Task Found! 😥")
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y:animateOnce ? 0 : 20)
                    .opacity(animateOnce ? 1 : 0)
            
                Text("Please click the add button to add some task")
                .font(.body)
                    .foregroundStyle(.secondary)
                    .offset(y:animateOnce ? 0 : 20)
                    .opacity(animateOnce ? 1 : 0)
            
                NavigationLink {
                    AddTask()
                } label: {
                    Text("Add Task")
                        .foregroundStyle(Color.appWhite)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .scaleEffect(animateForever ? 0.8 : 1)
                        .opacity(animateOnce ? 1 : 0)
                        .offset(y:animateOnce ? 0 : 20)
                }
                .padding(.top)
                
              
            }
            .padding(.horizontal)
            .frame(maxHeight: .infinity,alignment: .center)
            .onAppear(){
                if (animateForever && animateOnce){ return }
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                    withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
                        animateForever.toggle()
                    }
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        animateOnce
                            .toggle()
                    }
                }
              
            }
    }
}

#Preview {
    NoItems()
        
}
