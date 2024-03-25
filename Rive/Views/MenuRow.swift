//
//  MenuRow.swift
//  Rive
//
//  Created by Amish on 25/03/2024.
//

import SwiftUI

struct MenuRow: View {
    var item: MenuItem
    @Binding var selectedMenu: SelectedMenu
    var body: some View {
        HStack(spacing: 14.0) {
            item.icon.view()
                .frame(width: 34.0, height: 34.0)
                .opacity(0.6)
            Text(item.text)
                .customFont(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12.0)
        .background(
            RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                .fill(.blue)
                .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0.0)
                .frame(maxWidth: .infinity, alignment: .leading)
        )
        .background(Color(.background2))
        .onTapGesture {
            item.icon.setInput("active", value: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                item.icon.setInput("active", value: false)
            }
            withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)) {
                selectedMenu = item.menu
            }
        }
    }
}

#Preview {
    MenuRow(item: menuItems[0], selectedMenu: .constant(.darkmode))
}
