# NavigationStack

A custom implementation of SwiftUI's latest NavigationStack.

This is an experimental attempt to provide a SwiftUI-backed backward compatible API for the most recently introduced NavigationStack.

```swift
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
            Text("Page One")
        } else {
            Text("Page Two")
        }
    })
    .navigationTitle("Main Page")
}
```
