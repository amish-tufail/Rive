//
//  HCard.swift
//  Rive
//
//  Created by Amish on 25/03/2024.
//

import SwiftUI

struct HCard: View {
    var section: CourseSection
    var body: some View {
        HStack(spacing: 20.0) {
            VStack(alignment: .leading, spacing: 8.0) {
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
                    .customFont(.body)
                
            }
            Divider()
            section.image
        }
        .padding(30.0)
        .frame(maxWidth: .infinity, maxHeight: 110.0)
        .background(section.color)
        .foregroundStyle(.white)
        .mask(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
    }
}

#Preview {
    HCard(section: courseSections[0])
}
