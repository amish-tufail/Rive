//
//  SignInView.swift
//  Rive
//
//  Created by mac on 24/03/2024.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack(spacing: 24.0) {
            Text("Sign In")
                .customFont(.largeTitle)
            Text("Access to 240+ hours of content. Learn design and code, by builing real apps with Swift and SwifUI.")
                .customFont(.headline)
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundStyle(.secondary)
                TextField("", text: $email)
                    .customTextField(image: Image(.iconEmail))
            }
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(.subheadline)
                    .foregroundStyle(.secondary)
                SecureField("", text: $password)
                    .customTextField(image: Image(.iconLock))
            }
            Label("Sign in", systemImage: "arrow.right")
                .customFont(.headline)
                .padding(20.0)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "F77D8E"))
                .foregroundStyle(.white)
                .clipShape(.rect(topLeadingRadius: 0.0, bottomLeadingRadius: 20.0, bottomTrailingRadius: 20.0, topTrailingRadius: 20.0, style: .continuous))
                .clipShape(.rect(topLeadingRadius: 8.0, bottomLeadingRadius: 0.0, bottomTrailingRadius: 0.0, topTrailingRadius: 0.0, style: .continuous))
                .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 20.0, x: 0.0, y: 10.0)
            HStack {
                Rectangle()
                    .frame(height: 1.0)
                    .opacity(0.1)
                Text("OR")
                    .customFont(.subheadline2)
                    .foregroundStyle(.black.opacity(0.3))
                Rectangle()
                    .frame(height: 1.0)
                    .opacity(0.1)
            }
            Text("Sign up with Email, Apple or Google")
                .customFont(.subheadline)
                .foregroundStyle(.secondary)
            HStack {
                Image(.logoApple)
                Spacer()
                Image(.logoEmail)
                Spacer()
                Image(.logoGoogle)
            }
        }
        .padding(30.0)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .shadow(color: .shadow.opacity(0.3), radius: 5.0, x: 0.0, y: 3.0)
        .shadow(color: .shadow.opacity(0.3), radius: 30.0, x: 0.0, y: 30.0)
        .overlay {
            RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .padding()
    }
}

#Preview {
    SignInView()
}
