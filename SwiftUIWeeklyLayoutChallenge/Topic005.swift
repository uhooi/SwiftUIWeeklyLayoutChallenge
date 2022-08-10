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
                    Text("- Stacksと`layoutPriority(_:)`を使ってみる")
                } label: {
                    Text("001")
                }
                GroupBox {
                    Text(
                        """
                        - `NavigationLink`を使ってみる
                        - `List`を使ってみる
                        """
                    )
                } label: {
                    Text("002")
                }
                GroupBox {
                    Text(
                        """
                        - `Form`を使ってみる
                        - `Picker`と`pickerStyle(_:)`を使ってみる
                        - `fixedSize(horizontal:vertical:)`を使ってみる
                        """
                    )
                } label: {
                    Text("003")
                }
                GroupBox {
                    Text("- `PrimitiveButtonStyle`を使ってみる")
                } label: {
                    Text("004")
                }
            } label: {
                Group {
                    Text("#SwiftUIレイアウト一本勝負")
                        .font(.system(.title2, design: .monospaced).weight(.heavy))
                    Text("主なテーマ")
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
        }
    }
}

struct Topic005View_Previews: PreviewProvider {
    static var previews: some View {
        Topic005View()
    }
}
