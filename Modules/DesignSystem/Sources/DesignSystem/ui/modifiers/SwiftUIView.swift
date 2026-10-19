import SwiftUI


public extension View {
    func shimmer() -> some View {
        modifier(ShimmerModifier())
    }
}

private struct ShimmerModifier: ViewModifier {

    @State private var offset: CGFloat = ShimmerConstants.initialOffset

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geometry in
                    LinearGradient(
                        colors: [
                            .clear,
                            AppColors.backgroundPrimary.opacity(ShimmerConstants.highlightOpacity),
                            .clear
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: geometry.size.width * ShimmerConstants.highlightWidthRatio)
                    .offset(
                        x: offset * geometry.size.width * ShimmerConstants.offsetDistanceRatio
                    )
                }
                .clipped()
                .blendMode(.screen)
            }
            .onAppear {
                withAnimation(
                    .linear(duration: ShimmerConstants.animationDuration)
                    .repeatForever(autoreverses: false)
                ) {
                    offset = ShimmerConstants.finalOffset
                }
            }
    }
}

private enum ShimmerConstants {
    static let initialOffset: CGFloat = -1
    static let finalOffset: CGFloat = 1
    static let highlightOpacity: Double = 0.45
    static let highlightWidthRatio: CGFloat = 0.6
    static let offsetDistanceRatio: CGFloat = 2
    static let animationDuration: TimeInterval = 1.2
}
