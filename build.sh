#/bin/sh
swiftc \
  -o dynmov \
  main.swift \
  AppDelegate.swift \
  DesktopWindow.swift \
  VideoView.swift \
  -framework AppKit \
  -framework AVFoundation
