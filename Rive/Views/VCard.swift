//
//  VCard.swift
//  Rive
//
//  Created by Amish on 25/03/2024.
//

import SwiftUI

struct VCard: View {
    var course: Course
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(course.title)
                .customFont(.title2)
                .frame(maxWidth: 170.0, alignment: .leading)
                .layoutPriority(1)
            Text(course.subtitle)
                .customFont(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(0.7)
            Text(course.caption.uppercased())
                .customFont(.footnote2)
            Spacer()
            HStack {
                ForEach(Array([4, 5, 6].shuffled().enumerated()), id: \.offset) { index, number in
                    Image("Avatar \(number)")
                        .resizable()
                        .frame(width: 44.0, height: 44.0)
                        .mask(Circle())
                        .offset(x: CGFloat(index * -20))
                }
            }
        }
        .foregroundStyle(.white)
        .padding(30.0)
        .frame(width: 260.0, height: 310.0)
        .background(.linearGradient(colors: [course.color, course.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: course.color.opacity(0.3), radius: 8.0, x: 0.0, y: 12.0)
        .shadow(color: course.color.opacity(0.3), radius: 2.0, x: 0.0, y: 1.0)
        .overlay {
            course.image
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(20.0)
        }
    }
}

#Preview {
    VCard(course: courses[0])
}
