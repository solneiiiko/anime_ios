import Foundation

@MainActor
public protocol DiComponentFactory {
    
    associatedtype DEPENDENCIES
    associatedtype COMPONENT: DiComponent
        where COMPONENT.DEPENDENCIES == DEPENDENCIES

    static var dependenciesFactory: (() -> DEPENDENCIES)? { get set }
}

public extension DiComponentFactory {

    static func initialize(
        _ factory: @escaping () -> DEPENDENCIES
    ) {
        dependenciesFactory = factory
    }

    static func createComponent() -> COMPONENT {
        guard let factory = dependenciesFactory else {
            fatalError(
                "\(Self.self) is not initialized"
            )
        }

        return COMPONENT(
            dependencies: factory()
        )
    }
}
