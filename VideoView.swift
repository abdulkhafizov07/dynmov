import AppKit
import AVFoundation

class VideoView: NSView {

    private let player = AVPlayer()

    override func makeBackingLayer() -> CALayer {
        let layer = AVPlayerLayer(player: player)
        layer.videoGravity = .resizeAspectFill
        return layer
    }

    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()

        wantsLayer = true

        // Show file selector
        let panel = NSOpenPanel()
        panel.allowedFileTypes = ["mp4", "mov", "m4v"]  // allowed video types
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = false

        panel.begin { [weak self] response in
            guard response == .OK, let url = panel.url else { return }
            self?.playVideo(from: url)
        }
    }

    private func playVideo(from url: URL) {
        guard FileManager.default.fileExists(atPath: url.path) else {
            print("Video file not found")
            return
        }

        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
        player.actionAtItemEnd = .none

        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: item,
            queue: .main
        ) { [weak self] _ in
            self?.player.seek(to: .zero)
            self?.player.play()
        }

        player.play()
        print("Playing video from URL:", url)
    }
}
