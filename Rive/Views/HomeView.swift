//
//  HomeView.swift
//  Rive
//
//  Created by Amish on 25/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                content
            }
        }
        
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    var content: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text("Courses")
                .customFont(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20.0)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20.0) {
                    ForEach(courses) { course in
                            VCard(course: course)
                    }
                }
                .padding(20.0)
                .padding(.bottom, 10.0)
            }
            Text("Recent")
                .customFont(.title3)
                .padding(.horizontal, 20.0)
            VStack(spacing: 20.0) {
                ForEach(courseSections) { section in
                    HCard(section: section)
                }
            }
            .padding(20.0)
            
        }
    }
}
