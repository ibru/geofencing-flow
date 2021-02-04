//
//  ApplianceModeHeader.swift
//  GeofencingFlow
//
//  Created by Jiri Urbasek on 2/4/21.
//

import SwiftUI

struct ApplianceModeHeader: View {
    let title: String
    @Binding var selectedMode: ApplianceModeRow.ApplianceMode?
    @Binding var manualTemperature: Double

    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .foregroundColor(selectedMode != nil ? .primary : .secondary)

            if let mode = selectedMode {
                Spacer()
                Image(systemName: mode.displaySystemImangeName)

                if mode == .manual {
                    Text("\(manualTemperature, specifier: "%.1f°C")")
                        .padding(.leading, 2)
                }

                Text("").padding(.trailing, 10) // to make padding from right side
            }
        }
    }
}

struct ApplianceModeHeaderWrapper: View {
    @State(initialValue: ApplianceModeRow.ApplianceMode.manual) var mode: ApplianceModeRow.ApplianceMode?
    @State(initialValue: 22) var manualTemperature: Double

    var body: some View {
        ApplianceModeHeader(
            title: "Set appliance mode",
            selectedMode: $mode,
            manualTemperature: $manualTemperature
        )
            .previewLayout(.fixed(width: 400, height: 60))
    }
}

struct ApplianceModeHeader_Previews: PreviewProvider {
    static var previews: some View {
        ApplianceModeHeaderWrapper()
    }
}
