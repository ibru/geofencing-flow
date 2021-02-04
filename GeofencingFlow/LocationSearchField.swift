//
//  LocationSearchField.swift
//  GeofencingFlow
//
//  Created by Jiri Urbasek on 2/4/21.
//

import SwiftUI

struct LocationSearchField: View {
    @Binding var locationText: String

    var body: some View {
        HStack {
            TextField("Search ...", text: $locationText)
            Spacer()
            Image(systemName: "location")
        }
    }
}

struct LocationSearchField_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchField(locationText: .constant("Address"))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
