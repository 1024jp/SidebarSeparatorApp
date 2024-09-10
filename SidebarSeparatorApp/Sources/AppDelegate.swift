//
//  AppDelegate.swift
//  SidebarSeparatorApp
//
//  Created by 1024jp on 2024-09-10.
//

import AppKit

@main
final class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        WindowController().showWindow(nil)
    }
}
