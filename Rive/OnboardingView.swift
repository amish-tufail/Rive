//
//  OnboardingView.swift
//  Rive
//
//  Created by Amish on 24/03/2024.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let button =  RiveViewModel(fileName: "button")
    var body: some View {
        ZStack {
            background
            VStack(alignment: .leading) {
                Text("Learn design & code")
                    .font(.custom("Poppins Bold", size: 60.0, relativeTo: .largeTitle))
//                    .frame(width: 260.0, alignment: .leading)/
                Text("Dont skip design. Learn design and code, by building real apps with Swift and SwiftUI. Complete courses about the best tools.")
                    .customFont(.body)
                Spacer()
                startButton
                Text("Purchase inlcude access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.")
                    .customFont(.footnote)
                    .opacity(0.7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
            }
            .padding(40.0)
            .padding(.top, 40.0)
        }
    }
}

extension OnboardingView {
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30.0)
            .background(
                Image("Spline")
                    .blur(radius: 50.0)
                    .offset(x: 200.0, y: 100.0)
            )
    }
    
    var startButton: some View {
        button.view()
            .frame(width: 236.0, height: 64.0)
            .overlay {
                Label("Start the course", systemImage: "arrow.forward")
                    .offset(x: 4.0, y: 4.0)
                    .font(.headline)
            }
            .background(
                Color.black
                    .clipShape(.rect(cornerRadius: 10.0))
                    .blur(radius: 10.0)
                    .opacity(0.3)
                    .offset(y: 10.0)
            )
            .onTapGesture {
                button.play(animationName: "active")
            }
    }
}

#Preview {
    OnboardingView()
}
