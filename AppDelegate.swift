//
//  AppDelegate.swift
//  dynmov
//
//  Created by Developer LL on 29/01/26.
//

import AppKit
import AVFoundation

class AppDelegate: NSObject, NSApplicationDelegate {

    var windows: [NSWindow] = []

    func applicationDidFinishLaunching(_ notification: Notification) {
        for screen in NSScreen.screens {
            let window = DesktopWindow(screen: screen)
            let view = VideoView(frame: screen.frame)

            window.contentView = view
            window.makeKeyAndOrderFront(nil)
            windows.append(window)
        }
    }
}
