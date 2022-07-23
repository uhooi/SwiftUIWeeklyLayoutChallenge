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

struct ChevronLabelStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Label("5分前", systemImage: "chevron.forward")
            Label("1時間前", systemImage: "chevron.forward")
            Label("昨日", systemImage: "chevron.forward")
            Label("一昨日", systemImage: "chevron.forward")
        }
        .labelStyle(.chevron)
    }
}
