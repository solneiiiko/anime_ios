import Foundation

public protocol DiComponent {

    associatedtype DEPENDENCIES

    init(dependencies: DEPENDENCIES)
}
