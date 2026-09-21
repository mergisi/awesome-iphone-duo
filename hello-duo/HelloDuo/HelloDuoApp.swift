import SwiftUI

@main
struct HelloDuoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                #if DEBUG
                .task { renderOpenLayoutIfRequested() }
                #endif
        }
    }
}

#if DEBUG
/// Launch with `-renderOpen` to write the open-pose layout to Documents/open.png,
/// so it can be checked without unfolding the simulator.
@MainActor
private func renderOpenLayoutIfRequested() {
    guard CommandLine.arguments.contains("-renderOpen") else { return }
    let size = CGSize(width: 669, height: 951)
    let renderer = ImageRenderer(content: DuoLayout(isOpen: true).frame(width: size.width, height: size.height))
    renderer.scale = 2
    guard let data = renderer.uiImage?.pngData() else { return }
    let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("open.png")
    try? data.write(to: url)
}
#endif
