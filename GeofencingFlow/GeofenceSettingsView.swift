//
//  GeofenceSettingsView.swift
//  GeofencingFlow
//
//  Created by Jiri Urbasek on 1/28/21.
//

import SwiftUI
import MapKit

struct GeofenceSettingsView: View {
    var title: String

    private let places: [Place] = [
        .init(id: "p1", name: "Piazza dei Signori, Treviso", location: .init(latitude: 45.6658772714, longitude: 12.245525399))
    ]

    @Environment(\.presentationMode) var presentationMode

    @State private var region = MKCoordinateRegion(
        center: .init(latitude: 45.6658772714, longitude: 12.245525399),
        span: .init(latitudeDelta: 0.002, longitudeDelta: 0.002)
    )

    @State var locationText: String = "Treviso, piazza dei signori"

    @State var isApplianceModeExpandedAreaEntered = false
    @State var shouldSwitchOnAreaEntered = false
    @State var selectedModeAreaEntered: ApplianceModeRow.ApplianceMode? = nil
    @State var manualTemperatureAreaEntered: Double = 20

    @State var isApplianceModeExpandedAreaLeft = false
    @State var shouldSwitchOffAreaLeft = false
    @State var selectedModeAreaLeft: ApplianceModeRow.ApplianceMode? = nil
    @State var manualTemperatureAreaLeft: Double = 20

    @State var locationServicesEnabled = false

    var body: some View {
        List {
            Section(header: Text("Adjust appliance location")) {
                LocationSearchField(locationText: $locationText)

                Map(coordinateRegion: $region, annotationItems: places) {
                    MapAnnotation(coordinate: $0.coordinate) {
                        LocationAnnotation()
                    }
                }
                .frame(minHeight: 220)
                .listRowInsets(EdgeInsets())

                GeofenceAreaInfoView()
            }

            Section(header: Text("When area entered")) {
                TextCheckmarkRow(text: "Switch appliance ON", isChecked: $shouldSwitchOnAreaEntered)

                DisclosureGroup(
                    isExpanded: $isApplianceModeExpandedAreaEntered,
                    content: {
                        ApplianceModeRow(
                            selectedMode: $selectedModeAreaEntered,
                            manualTemperature: $manualTemperatureAreaEntered
                        )
                        .padding(.vertical)
                    },
                    label: {
                        ApplianceModeHeader(
                            title: "Set appliance mode",
                            selectedMode: $selectedModeAreaEntered,
                            manualTemperature: $manualTemperatureAreaEntered
                        )
                    }
                )
            }

            Section(header: Text("When area left")) {
                TextCheckmarkRow(text: "Switch appliance OFF", isChecked: $shouldSwitchOffAreaLeft)

                if !shouldSwitchOffAreaLeft {
                    DisclosureGroup(
                        isExpanded: $isApplianceModeExpandedAreaLeft,
                        content: {
                            ApplianceModeRow(
                                selectedMode: $selectedModeAreaLeft,
                                manualTemperature: $manualTemperatureAreaLeft
                            )
                            .padding(.vertical)
                        },
                        label: {
                            ApplianceModeHeader(
                                title: "Set appliance mode",
                                selectedMode: $selectedModeAreaLeft,
                                manualTemperature: $manualTemperatureAreaLeft
                            )
                        }
                    )
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(title)
        //.blur(radius: locationServicesEnabled ? 0 : 10) // blur causes to remove list view top insets, SwiftUI bug?
        .overlay(
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all).opacity(0.9)
                LocationServicesPrompt(isLocationServicesEnabled: $locationServicesEnabled)

            }
            .opacity(locationServicesEnabled ? 0 : 1)
            .animation(locationServicesEnabled ? .easeInOut : .none)
        )
    }
}

prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}

struct GeofenceSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                GeofenceSettingsView(title: "MDH 1")
            }
            .previewLayout(.fixed(width: 400, height: 1000))
        }
    }
}
