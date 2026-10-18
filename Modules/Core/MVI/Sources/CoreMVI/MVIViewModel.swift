import Foundation

@MainActor
public protocol MVIViewModel: AnyObject, Observable {
    associatedtype State
    associatedtype Intent

    var state: State { get }

    func send(_ intent: Intent)
}
