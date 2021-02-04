//
//  ApplianceModeRow.swift
//  GeofencingFlow
//
//  Created by Jiri Urbasek on 2/4/21.
//

import SwiftUI

struct ApplianceModeRow: View {
    enum ApplianceMode: Equatable, CaseIterable {
        case manual
        case day
        case night
        case antiFreeze
    }

    @Binding var selectedMode: ApplianceMode?
    @Binding var manualTemperature: Double

    var body: some View {
        VStack {
            HStack {
                ForEach(ApplianceMode.allCases) { mode in

                    VStack(spacing: 3) {
                        Button(action: {
                            if mode == selectedMode {
                                selectedMode = nil
                            } else {
                                selectedMode = mode
                            }
                        }, label: {
                            Image(systemName: mode.displaySystemImangeName)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(foregroundColor(for: mode))
                                .padding(8)
                                .frame(width: 50, height: 50)
                                .background(backgroundColor(for: mode))
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(foregroundColor(for: mode))
                                    )
                        })
                        .buttonStyle(BorderlessButtonStyle())


                        Text(mode.displayValue)
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical)

            if selectedMode == .manual {
                VStack(alignment: .leading) {
                    Slider(value: $manualTemperature, in: 10...30, step: 0.1, minimumValueLabel: Text("10°C").font(.caption), maximumValueLabel: Text("30°C").font(.caption)) {
                        EmptyView()
                    }
                    Text("Manual temperature is set to \(manualTemperature, specifier: "%.1f")°C")
                        .font(.caption)
                }
                .padding(.vertical)
            }
        }
    }

    func backgroundColor(for mode: ApplianceMode) -> Color {
        if mode == selectedMode {
            return .primary
        } else {
            return .clear
        }
    }

    func foregroundColor(for mode: ApplianceMode) -> Color {
        if mode == selectedMode {
            return .white
        } else {
            return .primary
        }
    }
}

extension ApplianceModeRow.ApplianceMode {
    var displayValue: String {
        switch self {
        case .manual:       return "Manual"
        case .day:          return "Day"
        case .night:        return "Night"
        case .antiFreeze:   return "Anti-freeze"
        }
    }

    var displaySystemImangeName: String {
        switch self {
        case .manual:       return "hand.raised"
        case .day:          return "sun.max"
        case .night:        return "moon"
        case .antiFreeze:   return "thermometer.snowflake"
        }
    }

    static var allWithDefaultValues: [Self] {
        [.manual, .day, .night, .antiFreeze]
    }
}

extension ApplianceModeRow.ApplianceMode: Identifiable {
    var id: String {
        displayValue
    }
}

struct ApplianceModeRowWrapper: View {
    @State(initialValue: .manual) var mode: ApplianceModeRow.ApplianceMode?
    @State(initialValue: 22) var manualTemperature: Double

    var body: some View {
        ApplianceModeRow(selectedMode: $mode, manualTemperature: $manualTemperature)
    }
}

struct ApplianceModeRow_Previews: PreviewProvider {
    static var previews: some View {
        ApplianceModeRowWrapper()
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
