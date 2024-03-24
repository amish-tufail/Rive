//
//  CustomTextField.swift
//  Rive
//
//  Created by mac on 24/03/2024.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    var image: Image
    func body(content: Content) -> some View {
        content
            .padding(15.0)
            .padding(.leading, 36.0)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.1))
            }
            .overlay {
                image
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8.0)
            }
    }
}

extension View {
    func customTextField(image: Image) -> some View {
        modifier(CustomTextField(image: image))
    }
}
