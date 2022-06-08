//
//  NavDestination.swift
//  NavStacks
//
//  Created by Przemyslaw Bobak on 08/06/2022.
//

import SwiftUI

struct NavDestination<Item: Hashable, AnContent: View>: ViewModifier {
    @EnvironmentObject var controller: NavController

    var item: Item.Type
    @ViewBuilder var content: (_ item: Item) -> AnContent

    func body(content: Content) -> some View {
        content
            .overlay(
                ForEach(controller.path.elements, id: \.self) { path in
                    NavigationLink(isActive: .init(get: {
                        return true
                    }, set: { newValue in
                        if newValue {
                            return
                        } else {
                            controller.path.elements.removeAll(where: { $0 == path })
                        }
                    }), destination: {
                        if let value = path as? Item {
                            self.content(value)
                        }
                    }, label: {
                        EmptyView()
                    })
                }
            )
    }
}

extension View {
    func navDestination<Item: Hashable, Content: View>(item: Item.Type, @ViewBuilder content: @escaping (_ item: Item) -> Content) -> some View {
        modifier(NavDestination(item: item, content: content))
    }
}
