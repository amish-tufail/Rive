//
//  TabBar.swift
//  Rive
//
//  Created by Amish on 24/03/2024.
//

import SwiftUI
import RiveRuntime

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            item.icon.setInput("active", value: false)
                        }
                        withAnimation {
                            selectedTab = item.tab
                        }
                    } label: {
                        item.icon.view()
                            .frame(height: 36.0)
                            .opacity(selectedTab == item.tab ? 1.0 : 0.5)
                            .background(
                                VStack {
                                    RoundedRectangle(cornerRadius: 2.0, style: .continuous)
                                        .fill(Color.accentColor)
                                        .frame(width: selectedTab == item.tab ? 20.0 : 0.0, height: 4.0)
                                        .offset(y: -4.0)
                                        .opacity(selectedTab == item.tab ? 1.0 : 0.0)
                                    Spacer()
                                }
                            )
                    }
                }
            }
            .padding(12.0)
            .background(Color(.background2).opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 24.0, style: .continuous))
            .shadow(color: Color(.background2).opacity(0.3), radius: 20.0, x: 0.0, y: 20.0)
            .overlay {
                RoundedRectangle(cornerRadius: 24.0, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0.0)], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
            .padding(.horizontal, 24.0)
        }
    }
}

#Preview {
    TabBar()
}

struct TabItem: Identifiable {
    var id = UUID()
    var icon: RiveViewModel
    var tab: Tab
}

var tabItems = [
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), tab: .chat),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), tab: .search),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), tab: .timer),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), tab: .bell),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user)
]

enum Tab: String {
    case chat
    case search
    case timer
    case bell
    case user
}
