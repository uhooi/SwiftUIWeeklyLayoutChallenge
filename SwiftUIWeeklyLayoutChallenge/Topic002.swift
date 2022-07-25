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
            switch style {
            case .percent:
                valueString = value.formatted(.percent)
            case .decimal:
                valueString = value.formatted(.number)
            default:
                preconditionFailure("The implementation was omitted.")
            }
            return valueString + (customUnit ?? "")
        case .dateComponents(let dateComponents):
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .abbreviated
            formatter.allowedUnits = [.hour, .minute]
            return formatter.string(from: dateComponents)!
        case .measurement(let value, let unit, let formattedUnit):
            let measurement = Measurement(
                value: value,
                unit: (formattedUnit ?? unit)
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
            List(vitalData) { vital in
                Topic002ListRowView(vital: vital)
                    .vitalNavigationLink(destination: EmptyView())
            }
            .navigationTitle("バイタルデータ")
        }
    }
}

private extension View {
    func vitalNavigationLink<Destination: View>(destination: Destination) -> some View {
#if os(iOS)
        self.overlay(
            NavigationLink(destination: destination) {
                EmptyView()
            }.opacity(0)
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
    
#if os(watchOS)
    private let vStackSpacing: CGFloat? = nil
#else
    private let vStackSpacing: CGFloat? = 18
#endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: vStackSpacing) {
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
            valueText
        }
        .padding(.vertical, 6)
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
