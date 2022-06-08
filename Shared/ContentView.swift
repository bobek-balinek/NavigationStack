//
//  ContentView.swift
//  Shared
//
//  Created by Przemyslaw Bobak on 08/06/2022.
//

import SwiftUI

struct ContentView: View {
    enum Pages: Hashable {
        case one
        case two
    }

    var body: some View {
        NavStack {
            List {
                NavLink(value: Pages.one) {
                    Text("One")
                }
                NavLink(value: Pages.two) {
                    Text("Two")
                }
            }
            .navDestination(item: Pages.self, content: { item in
                if item == Pages.one {
                    Text("YAY")
                } else {
                    Text("NADA")
                }
            })
            .navigationTitle("Main Page")
        }
    }
}
