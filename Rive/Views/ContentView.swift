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
    @State private var show = false
    
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    var body: some View {
        ZStack {
            Color.background2.ignoresSafeArea()
            SideMenu()
                .opacity(isOpen ? 1.0 : 0.0)
                .offset(x: isOpen ? 0.0 : -300.0)
                .rotation3DEffect(
                    .degrees(isOpen ? 0.0 : 30), axis: (x: 0.0, y: 1.0, z: 0.0)
                )
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
            // Side Menu Start
            .mask(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
            .rotation3DEffect(
                .degrees(isOpen ? 30 : 0.0),axis: (x: 0.0, y: -1.0, z: 0.0)
            )
            .offset(x: isOpen ? 265.0 : 0.0)
            .scaleEffect(isOpen ? 0.9 : 1.0)
            // Side Menu End
            .scaleEffect(show ? 0.92 : 1.0)
            .ignoresSafeArea()
            Image(systemName: "person")
                .frame(width: 36.0, height: 36.0)
                .background(.white)
                .mask(Circle())
                .shadow(color: .shadow.opacity(0.2), radius: 5.0, x: 0.0, y: 5.0)
                .onTapGesture {
                    withAnimation(.spring()) {
                        show = true
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
                .offset(y: 4.0)
                .offset(x: isOpen ? 44.0 : 0.0)
            button.view()
                .frame(width: 44.0, height: 44.0)
                .mask(Circle())
                .shadow(color: .shadow.opacity(0.2), radius: 5.0, x: 0.0, y: 5.0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isOpen ? 216.0 : 0.0)
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isOpen.toggle()
                    }
                }
            TabBar()
                .offset(y: isOpen ? 300.0 : 0.0)
                .offset(y: show ? 200.0 : 0.0)
                .offset(y: -24.0)
                .background(
                    LinearGradient(colors: [Color.background.opacity(0.0), Color.background], startPoint: .top, endPoint: .bottom)
                        .frame(height: 150.0)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .allowsHitTesting(false)
                )
                .ignoresSafeArea()
            if show {
                OnboardingView(show: $show)
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
                    .shadow(color: .black.opacity(0.5), radius: 4.0, x: 0.0, y: 4.0)
                    .ignoresSafeArea(.all, edges: .top)
                    .transition(.move(edge: .top))
                    .offset(y: show ? -10.0 : 0.0)
                    .zIndex(1)
            }
        }
    }
}

#Preview {
    ContentView()
}
