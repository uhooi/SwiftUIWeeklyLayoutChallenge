//
//  Topic005BulletLabelStyle.swift
//  SwiftUIWeeklyLayoutChallenge
//
//  Created by uhooi on 11.8.2022.
//

import SwiftUI

struct BulletLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top) {
            configuration.icon
            configuration.title
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension LabelStyle where Self == BulletLabelStyle {
    static var bullet: BulletLabelStyle {
        .init()
    }
}

struct BulletLabelStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Label {
                Text("Stacksと`layoutPriority(_:)`を使ってみる")
            } icon: {
                Text("•")
            }
        }
        .labelStyle(.bullet)
    }
}
