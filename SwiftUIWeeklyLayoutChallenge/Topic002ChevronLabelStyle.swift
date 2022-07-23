//
//  Topic002ChevronLabelStyle.swift
//  SwiftUIWeeklyLayoutChallenge
//
//  Created by uhooi on 2022/07/23.
//

import SwiftUI

struct ChevronLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
                .font(.footnote)
                .foregroundColor(.secondary)
            configuration.icon
                .font(.footnote.weight(.bold))
                .foregroundColor(Color(uiColor: .systemGray3))
        }
    }
}

extension LabelStyle where Self == ChevronLabelStyle {
    static var chevron: ChevronLabelStyle {
        .init()
    }
}
