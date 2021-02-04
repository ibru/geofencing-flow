//
//  LocationServicesPrompt.swift
//  GeofencingFlow
//
//  Created by Jiri Urbasek on 2/4/21.
//

import SwiftUI

struct LocationServicesPrompt: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var isLocationServicesEnabled: Bool

    var body: some View {
        VStack {
            Text("For geofencing features you need to enable location services.")
                .multilineTextAlignment(.center)
                .shadow(radius: 0.5, x: 0.5, y: 0.5)
                .font(.title)
                .padding(30)

            Button(action: {
                isLocationServicesEnabled = true
            }, label: {
                Text("Enable location")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
            })
            .background(
                Capsule()
                    .fill(Color.blue)
            )

            Button(action: {
                isLocationServicesEnabled = false

                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
                    .font(.headline)
                    .underline()
                    .foregroundColor(.primary)
                    .padding()
                    .padding(.horizontal)
            })
        }
    }
}

struct LocationServicesPrompt_Previews: PreviewProvider {
    static var previews: some View {
        LocationServicesPrompt(isLocationServicesEnabled: .constant(true))
    }
}
