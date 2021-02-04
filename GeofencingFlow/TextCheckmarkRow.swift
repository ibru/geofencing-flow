//
//  TextCheckmarkRow.swift
//  GeofencingFlow
//
//  Created by Jiri Urbasek on 2/4/21.
//

import SwiftUI

struct TextCheckmarkRow: View {
    var text: String
    @Binding var isChecked: Bool

    var imageName: String { isChecked ? "checkmark.square" : "square" }

    var color: Color { isChecked ? .primary : .secondary }

    var body: some View {
        Toggle(isOn: $isChecked, label: {
            Text(text)
                .foregroundColor(color)
        })
        .toggleStyle(CheckboxStyle(color: color))
    }
}

struct TextCheckmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        TextCheckmarkRow(text: "Switch Appliance off", isChecked: .constant(true))
            .previewLayout(.fixed(width: 400, height: 60))

        TextCheckmarkRow(text: "Switch Appliance off", isChecked: .constant(false))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}

struct CheckboxStyle: ToggleStyle {
    var color: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(color)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}
