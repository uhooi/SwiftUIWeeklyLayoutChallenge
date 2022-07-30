//
//  Topic003.swift
//  SwiftUIWeeklyLayoutChallenge
//
//  Created by treastrain on 2022/07/27.
//
import SwiftUI

/// <doc:Topic003>
public struct Topic003View: View {
    public init() {}
    
    public var body: some View {
#if os(macOS)
        DepartureSignal()
            .padding()
#else
        NavigationView {
            List {
                DepartureSignal(signal: .出発進行)
                    .padding()
                DepartureText(signal: .出発進行)
            }
            .navigationTitle("出発信号機")
        }
#endif
    }
}

struct DepartureSignal: View {
    enum Signal: String, CaseIterable, Identifiable {
        /// 上の灯火から順に 消・消・緑・消 で進行信号を現示。
        case 出発進行
        /// 上の灯火から順に 黄・消・消・緑 で減速信号を現示。
        case 出発減速
        /// 上の灯火から順に 消・消・消・黄 で注意信号を現示。
        case 出発注意
        /// 上の灯火から順に 黄・消・消・黄 で警戒信号を現示。
        case 出発警戒
        /// 上の灯火から順に 消・赤・消・消 で停止信号を現示。
        case 出発停止
        
        var id: String { rawValue }
    }
    
    var signal: Signal
    
    var body: some View {
        VStack {
            switch signal {
            case .出発進行:
                blackLight
                blackLight
                greenLight
                blackLight
            case .出発減速:
                yellowLight
                blackLight
                blackLight
                greenLight
            case .出発注意:
                blackLight
                blackLight
                blackLight
                yellowLight
            case .出発警戒:
                yellowLight
                blackLight
                blackLight
                yellowLight
            case .出発停止:
                blackLight
                redLight
                blackLight
                blackLight
            }
        }
    }
    
    private var greenLight: some View { light(color: .green) }
    private var yellowLight: some View { light(color: .yellow) }
    private var redLight: some View { light(color: .red) }
    private var blackLight: some View { light(color: .black) }
    
    private var light: some View {
        Image(systemName: "circle.fill")
            .font(.largeTitle)
    }
    
    private func light(color: Color) -> some View {
        light.foregroundColor(color)
    }
}

struct DepartureText: View {
    var body: some View {
        Text(signal.rawValue)
            .font(.largeTitle.bold())
    }
    
    @State var signal: DepartureSignal.Signal
}

struct Topic003View_Previews: PreviewProvider {
    static var previews: some View {
        Topic003View()
    }
}
