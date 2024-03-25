//
//  ContentView.swift
//  Rive
//
//  Created by mac on 22/03/2024.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    @State private var isOpen = false
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("Search")
                case .timer:
                    Text("Timer")
                case .bell:
                    Text("Bell")
                case .user:
                    Text("User")
                }
            }
            .safeAreaInset(edge: .bottom) { // Give all views a padding like thing instead of giving each themselves
                Color.clear.frame(height: 80.0)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 104.0)
            }
            button.view()
                .frame(width: 44.0, height: 44.0)
                .mask(Circle())
                .shadow(color: .shadow.opacity(0.2), radius: 5.0, x: 0.0, y: 5.0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    isOpen.toggle()
                }
            TabBar()
        }
    }
}

#Preview {
    ContentView()
}
