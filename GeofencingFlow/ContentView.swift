//
//  ContentView.swift
//  GeofencingFlow
//
//  Created by Jiri Urbasek on 1/28/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("My Appliances")
                .tabItem {
                    Image(systemName: "xserve")
                    Text("Appliances")
                }

            Text("My Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            NavigationView {
                List {
                    Section(header: Text("Define automatic actions for your appliances when you enter or leave a location").padding()) {
                        NavigationLink(
                            destination: GeofenceSettingsView(title: "Smart Heater 1"),
                            label: {
                                Text("Smart Heater 1")
                                    .frame(height: 50)
                            }
                        )
                        NavigationLink(
                            destination: GeofenceSettingsView(title: "Smart Heater 2"),
                            label: {
                                Text("Smart Heater 2")
                                    .frame(height: 50)
                            }
                        )
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Geofencing")

            }
            .tabItem {
                Image(systemName: "paperplane.fill")
                Text("Geofencing")
            }

            Text("settings")
                .tabItem {
                    Image(systemName: "gearshape.2")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
