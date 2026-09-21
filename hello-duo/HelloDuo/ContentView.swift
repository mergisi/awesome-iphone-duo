import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            // Measure the whole screen, not just the safe area: the cover display is
            // ~466 pt wide, the inner display ~669 pt, so 560 sits between the two.
            let fullWidth = geo.size.width + geo.safeAreaInsets.leading + geo.safeAreaInsets.trailing
            let isOpen = fullWidth > 560

            DuoLayout(isOpen: isOpen)
                .animation(.spring(duration: 0.6), value: isOpen)
        }
    }
}

struct DuoLayout: View {
    let isOpen: Bool

    var body: some View {
        ZStack {
            LinearGradient(
                colors: isOpen
                    ? [Color(red: 0.07, green: 0.12, blue: 0.24), Color(red: 0.80, green: 0.45, blue: 0.25)]
                    : [Color(red: 0.10, green: 0.09, blue: 0.16), Color(red: 0.36, green: 0.27, blue: 0.20)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            if isOpen {
                HStack(spacing: 0) {
                    HelloPane(emoji: "👐", title: "Hello again,\nDuo")
                    Rectangle()
                        .fill(.white.opacity(0.18))
                        .frame(width: 1)
                        .padding(.vertical, 60)
                    InfoPane(isOpen: true)
                }
                .transition(.opacity.combined(with: .scale(scale: 0.92)))
            } else {
                VStack(spacing: 32) {
                    HelloPane(emoji: "👋", title: "Hello, Duo")
                    InfoPane(isOpen: false)
                }
                .transition(.opacity.combined(with: .scale(scale: 1.08)))
            }
        }
    }
}

private struct HelloPane: View {
    let emoji: String
    let title: String
    @State private var waving = false

    var body: some View {
        VStack(spacing: 16) {
            Text(emoji)
                .font(.system(size: 96))
                .rotationEffect(.degrees(waving ? 18 : -8), anchor: .bottomTrailing)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                        waving = true
                    }
                }
            Text(title)
                .font(.system(size: 52, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.6)
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private struct InfoPane: View {
    let isOpen: Bool

    var body: some View {
        VStack(spacing: 14) {
            Text(isOpen ? "OPEN" : "FOLDED")
                .font(.system(size: 15, weight: .semibold, design: .monospaced))
                .tracking(4)
                .foregroundStyle(.white.opacity(0.6))
            Text(isOpen ? "Now there's room.\nTwo panes, one app." : "Unfold me.")
                .font(.system(size: 26, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundStyle(.white.opacity(0.75))
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview("Folded") {
    DuoLayout(isOpen: false)
        .frame(width: 382, height: 644)
}

#Preview("Open") {
    DuoLayout(isOpen: true)
        .frame(width: 585, height: 917)
}
