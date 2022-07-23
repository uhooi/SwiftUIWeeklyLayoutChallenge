//
//  File.swift
//  SwiftUIWeeklyLayoutChallenge
//
//  Created by uhooi on 2022/07/23.
//

import SwiftUI

struct VitalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .font(.headline)
            configuration.title
                .font(.subheadline.bold())
        }
    }
}

extension LabelStyle where Self == VitalLabelStyle {
    static var vital: VitalLabelStyle {
        .init()
    }
}

struct VitalLabelStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Label("取り込まれた酸素のレベル", systemImage: "o.circle.fill")
            Label("心拍数", systemImage: "heart.fill")
            Label("睡眠", systemImage: "bed.double.fill")
            Label("体温", systemImage: "thermometer")
        }
        .labelStyle(.vital)
    }
}
