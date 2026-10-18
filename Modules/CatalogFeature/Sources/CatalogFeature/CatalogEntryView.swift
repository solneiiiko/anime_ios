import SwiftUI

public struct CatalogEntryView: View {

    @State
    private var component: CatalogDiComponent

    public init() {
        _component = State(
            initialValue:
                CatalogDiComponentFactory.createComponent()
        )
    }

    public var body: some View {
        component
            .makeRootView()
        // TODO check idea
//            .environment(
//                \.catalogDiComponent,
//                component
//            )
    }
}
