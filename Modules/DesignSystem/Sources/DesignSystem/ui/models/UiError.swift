import Foundation

public struct UiError {
    public let title: LocalizedStringResource
    public let subtitle: LocalizedStringResource
    
    public init(
        title: LocalizedStringResource,
        subtitle: LocalizedStringResource,
    ) {
        self.title = title
        self.subtitle = subtitle
    }
}
