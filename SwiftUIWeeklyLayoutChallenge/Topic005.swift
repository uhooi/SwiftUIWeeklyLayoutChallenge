//
//  Topic005.swift
//  SwiftUIWeeklyLayoutChallenge
//
//  Created by treastrain on 2022/08/10.
//

import SwiftUI

/// <doc:Topic005>
public struct Topic005View: View {
    public init() {}
    
    public var body: some View {
        ScrollView {
            GroupBox {
                GroupBox {
                    BulletLabel("Stacksと`layoutPriority(_:)`を使ってみる")
                } label: {
                    Text("001")
                }
                GroupBox {
                    BulletLabel("`NavigationLink`を使ってみる")
                    BulletLabel("`List`を使ってみる")
                } label: {
                    Text("002")
                }
                GroupBox {
                    BulletLabel("`Form`を使ってみる")
                    BulletLabel("`Picker`と`pickerStyle(_:)`を使ってみる")
                    BulletLabel("`fixedSize(horizontal:vertical:)`を使ってみる")
                } label: {
                    Text("003")
                }
                GroupBox {
                    BulletLabel("`PrimitiveButtonStyle`を使ってみる")
                } label: {
                    Text("004")
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
    let title: LocalizedStringKey
    
    init(_ title: LocalizedStringKey) {
        self.title = title
    }
    
    var body: some View {
        Label {
            Text(title)
        } icon: {
            Text("・")
        }
        .labelStyle(.bullet)
    }
}

struct Topic005View_Previews: PreviewProvider {
    static var previews: some View {
        Topic005View()
    }
}
