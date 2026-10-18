import Foundation
import CoreDI

@MainActor
public enum CatalogDiComponentFactory: DiComponentFactory {

    public typealias DEPENDENCIES = CatalogDependencies
    public typealias COMPONENT = CatalogDiComponent

    public static var dependenciesFactory: (() -> CatalogDependencies)?
}
