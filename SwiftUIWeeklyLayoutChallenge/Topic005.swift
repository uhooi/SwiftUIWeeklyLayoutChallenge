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
                    BulletText("Stacksと`layoutPriority(_:)`を使ってみる")
                        .frame(maxWidth: .infinity, alignment: .leading)
                } label: {
                    Text("001")
                }
                GroupBox {
                    Group {
                        BulletText("`NavigationLink`を使ってみる")
                        BulletText("`List`を使ってみる")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                } label: {
                    Text("002")
                }
                GroupBox {
                    Group {
                        BulletText("`Form`を使ってみる")
                        BulletText("`Picker`と`pickerStyle(_:)`を使ってみる")
                        BulletText("`fixedSize(horizontal:vertical:)`を使ってみる")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                } label: {
                    Text("003")
                }
                GroupBox {
                    BulletText("`PrimitiveButtonStyle`を使ってみる")
                        .frame(maxWidth: .infinity, alignment: .leading)
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

private struct BulletText: View {
    let text: LocalizedStringKey
    
    init(_ text: LocalizedStringKey) {
        self.text = text
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Text("・")
            Text(text)
        }
    }
}

struct Topic005View_Previews: PreviewProvider {
    static var previews: some View {
        Topic005View()
    }
}
