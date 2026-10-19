import SwiftUI

public struct CatalogEntryView: View {

    @State
    private var component: CatalogDiComponent

    public init(dependencies: CatalogDependencies) {
        _component = State(
            initialValue: CatalogDiComponent(
                dependencies: dependencies
            )
        )
    }

    public var body: some View {
        component.makeRootView()
    }
}
