//
//  GeofenceAreaInfoView.swift
//  GeofencingFlow
//
//  Created by Jiri Urbasek on 2/4/21.
//

import SwiftUI

struct GeofenceAreaInfoView: View {
    var body: some View {
        HStack {
            HStack(spacing: 3) {
                Text("Home Radius:")
                Text("500m")
                    .bold()
            }
            Spacer()
            Text("Good range")
                .foregroundColor(.green)
        }
    }
}

struct GeofenceAreaInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GeofenceAreaInfoView()
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
