//
//  Topic004.swift
//  SwiftUIWeeklyLayoutChallenge
//
//  Created by treastrain on 2022/08/03.
//
import SwiftUI

/// <doc:Topic004>
public struct Topic004View: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("\(Int.random(in: 2...100))")
                .font(.system(size: 64, design: .monospaced).weight(.heavy))
            HStack {
                Button("Prime") {
                    print("")
                }
                Text("or")
                Button("Composite") {
                    print("")
                }
            }
            .font(.system(.largeTitle, design: .rounded).weight(.heavy))
        }
    }
}

struct Topic004View_Previews: PreviewProvider {
    static var previews: some View {
        Topic004View()
    }
}
