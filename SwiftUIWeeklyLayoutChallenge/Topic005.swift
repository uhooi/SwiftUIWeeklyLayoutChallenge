//
//  Topic005.swift
//  SwiftUIWeeklyLayoutChallenge
//
//  Created by treastrain on 2022/08/10.
//

import SwiftUI

// MARK: - Entities

private struct Topic: Identifiable {
    let id = UUID()
    let title: LocalizedStringKey
    let themes: [LocalizedStringKey]
}

// MARK: - Sample Data

private let topics: [Topic] = [
    .init(title: "001", themes: [
        "Stacksと`layoutPriority(_:)`を使ってみる",
    ]),
    .init(title: "002", themes: [
        "`NavigationLink`を使ってみる",
        "`List`を使ってみる",
    ]),
    .init(title: "003", themes: [
        "`Form`を使ってみる",
        "`Picker`と`pickerStyle(_:)`を使ってみる",
        "`fixedSize(horizontal:vertical:)`を使ってみる",
    ]),
    .init(title: "004", themes: [
        "`PrimitiveButtonStyle`を使ってみる",
    ]),
]

// MARK: - Views

/// <doc:Topic005>
public struct Topic005View: View {
    public init() {}
    
    public var body: some View {
        ScrollView {
            GroupBox {
                ForEach(topics) { topic in
                    GroupBox {
                        ForEach(0..<topic.themes.count, id: \.self) { themeIndex in
                            BulletLabel(topic.themes[themeIndex])
                        }
                    } label: {
                        Text(topic.title)
                    }
                }
            } label: {
                Group {
                    Text("#SwiftUIレイアウト一本勝負")
                        .font(.system(.title2, design: .monospaced).weight(.heavy))
                        .foregroundStyle(rainbowGradient)
                        .scaleEffect(x: 1, y: 3) // FIXME: Remove it
                    Text("主なテーマ")
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
        }
    }
    
    private var rainbowGradient: LinearGradient {
        .init(
            colors: [.purple, .red, .orange, .yellow, .green, .blue, .purple],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}

private struct BulletLabel: View {
    private let title: LocalizedStringKey
    
    init(_ title: LocalizedStringKey) {
        self.title = title
    }
    
    var body: some View {
        Label {
            Text(title)
        } icon: {
            Text("•")
        }
        .labelStyle(.bullet)
    }
}

struct Topic005View_Previews: PreviewProvider {
    static var previews: some View {
        Topic005View()
    }
}
