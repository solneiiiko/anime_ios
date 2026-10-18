import Foundation
import CoreDI

@MainActor
public enum EntityDataImplAnimeDiComponentFactory: DiComponentFactory {

    public typealias DEPENDENCIES = EntityDataImplAnimeDependencies
    public typealias COMPONENT = EntityDataImplAnimeDiComponent

    public static var dependenciesFactory: (() -> EntityDataImplAnimeDependencies)?
}
