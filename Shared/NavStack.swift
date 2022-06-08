//
//  NavStack.swift
//  NavStacks
//
//  Created by Przemyslaw Bobak on 08/06/2022.
//

import SwiftUI

struct NavStack<Content: View>: View {
    var content: Content

    @StateObject var controller = NavController()

    init(_ content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationView {
            content
                .environmentObject(controller)
        }
        #if TARGET_OS_IOS
            .navigationViewStyle(.stack)
        #endif
    }
}
