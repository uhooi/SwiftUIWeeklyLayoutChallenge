//
//  Topic005BulletLabel.swift
//  SwiftUIWeeklyLayoutChallenge
//
//  Created by uhooi on 11.8.2022.
//

import SwiftUI

struct BulletLabel: View {
    private let title: LocalizedStringKey
    private let mark: String
    
    init(_ title: LocalizedStringKey, mark: String = "•") {
        self.title = title
        self.mark = mark
    }
    
    var body: some View {
        Label {
            Text(title)
        } icon: {
            Text(mark)
        }
        .labelStyle(.bullet)
    }
}

struct BulletLabel_Previews: PreviewProvider {
    static var previews: some View {
        BulletLabel("Stacksと`layoutPriority(_:)`を使ってみる")
    }
}

private struct BulletLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .firstTextBaseline) {
            configuration.icon
            configuration.title
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private extension LabelStyle where Self == BulletLabelStyle {
    static var bullet: BulletLabelStyle {
        .init()
    }
}

struct BulletLabelStyle_Previews: PreviewProvider {
    static var previews: some View {
        Label {
            Text("Stacksと`layoutPriority(_:)`を使ってみる")
        } icon: {
            Text("•")
        }
        .labelStyle(.bullet)
    }
}
