//
//  Topic002View.swift
//  SwiftUIWeeklyLayoutChallenge
//
//  Created by treastrain on 2022/07/20.
//

import SwiftUI

// MARK: - Entities
fileprivate struct Vital: Identifiable {
    let id = UUID()
    let title: LocalizedStringKey
    let value: Value
    let date: Date
    let iconSystemName: String
    let color: Color
    
    enum Value {
        case number(value: Double, style: NumberFormatter.Style, customUnit: String? = nil)
        case dateComponents(_ dateComponents: DateComponents)
        case measurement(value: Double, unit: Dimension, formattedUnit: Dimension? = nil)
    }
    
    func valueString() -> String {
        switch value {
        case .number(let value, let style, let customUnit):
            let valueString: String
            if let customUnit = customUnit {
                let measurement = Measurement(
                    value: value,
                    unit: .init(symbol: customUnit)
                )
                let formatter = MeasurementFormatter()
                formatter.numberFormatter.numberStyle = style
                valueString = formatter.string(from: measurement)
            } else {
                let formatter = NumberFormatter()
                formatter.numberStyle = style
                valueString = formatter.string(from: value as NSNumber)!
            }
            return valueString
        case .dateComponents(let dateComponents):
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .abbreviated
            let hour = dateComponents.minute! / 60
            let minute = dateComponents.minute! % 60
            return formatter.string(from: DateComponents(
                hour: hour,
                minute: minute
            ))!
        case .measurement(let value, let unit, let formattedUnit):
            let measurement = Measurement(
                value: value,
                unit: formattedUnit != nil ? formattedUnit! : unit
            )
            return "\(measurement)"
        }
    }
}

// MARK: - Sample Data
fileprivate let vitalData: [Vital] = [
    .init(title: "取り込まれた酸素のレベル", value: .number(value: 0.99, style: .percent), date: Date(timeIntervalSinceNow: -300), iconSystemName: "o.circle.fill", color: .blue),
    .init(title: "心拍数", value: .number(value: 61, style: .decimal, customUnit: "拍/分"), date: Date(timeIntervalSinceNow: -5400), iconSystemName: "heart.fill", color: .red),
    .init(title: "睡眠", value: .dateComponents(.init(minute: 451)), date: Date(timeIntervalSinceNow: -87000), iconSystemName: "bed.double.fill", color: .green),
    .init(title: "体温", value: .measurement(value: 36.4, unit: UnitTemperature.celsius), date: Date(timeIntervalSinceNow: -172800), iconSystemName: "thermometer", color: .red),
]

// MARK: - Views
/// <doc:Topic002>
public struct Topic002View: View {
    public init() {}
    
    public var body: some View {
        NavigationView {
            List {
                ForEach(vitalData, id: \.id) { vital in
                    Topic002ListRowView(vital: vital)
                        .navigationLink(destination: EmptyView())
                }
            }
            .navigationTitle("バイタルデータ")
        }
    }
}

private extension View {
    func navigationLink<Destination: View>(destination: Destination) -> some View {
#if os(iOS)
        self
            .overlay(
                NavigationLink(destination: destination) {
                    EmptyView()
                }
                    .opacity(0)
            )
#else
        NavigationLink(destination: destination) {
            self
        }
#endif
    }
}

struct Topic002View_Previews: PreviewProvider {
    static var previews: some View {
        Topic002View()
    }
}

private struct Topic002ListRowView: View {
    let vital: Vital
    
    var body: some View {
        VStack {
            HStack {
                Label(vital.title, systemImage: vital.iconSystemName)
                    .labelStyle(.vital)
                    .foregroundColor(vital.color)
                Spacer()
                Label(
                    vital.date.formatted(.relative(presentation: .named)),
                    systemImage: "chevron.forward"
                )
                .labelStyle(.chevron)
            }
#if os(iOS)
            .padding(.vertical, 6)
#else
            .padding(.top, 6)
#endif
            Spacer()
            valueText
                .frame(maxWidth: .infinity, alignment: .leading)
#if os(iOS)
                .padding(.vertical, 6)
#else
                .padding(.bottom, 6)
#endif
        }
    }
    
    private var valueText: Text {
        var textArray: [Text] = []
        for c in vital.valueString() {
            let text: Text
            if c.isNumericOrDot() {
                text = Text(String(c))
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.medium)
            } else {
                text = Text(String(c))
                    .font(.callout.bold())
                    .foregroundColor(.secondary)
            }
            textArray.append(text)
        }
        return textArray.reduce(Text(""), +)
    }
}

private extension Character {
    func isNumericOrDot() -> Bool {
        return String(self).range(of: "[0-9\\.]", options: .regularExpression) != nil
    }
}

struct Topic002ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(vitalData, id: \.id) { vital in
                Topic002ListRowView(vital: vital)
            }
        }
    }
}
