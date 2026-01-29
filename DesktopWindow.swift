import AppKit

class DesktopWindow: NSWindow {

    init(screen: NSScreen) {
        super.init(
            contentRect: screen.frame,
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )

        // Set window level to desktop
        level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.desktopWindow)))

        isOpaque = false
        backgroundColor = .clear
        hasShadow = false
        ignoresMouseEvents = true

        collectionBehavior = [
            .canJoinAllSpaces,
            .stationary,
            .ignoresCycle
        ]

        // Make sure it matches the screen frame
        setFrame(screen.frame, display: true)
    }
}
