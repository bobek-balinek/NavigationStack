//
//  NavLink.swift
//  NavStacks
//
//  Created by Przemyslaw Bobak on 08/06/2022.
//

import SwiftUI

struct NavLink<Label, Item>: View where Label : View, Item : Hashable {
    var label: Label
    var value: Item

    @EnvironmentObject var controller: NavController

    init(value: Item, label: () -> Label) {
        self.label = label()
        self.value = value
    }

    var body: some View {
        Button {
            controller.path.append(value)
        } label: {
            HStack {
                label
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
    }
}
