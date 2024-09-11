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
        
        // create programmatically
        let codeWindowController = WindowController(viewController: ContentViewController())
        codeWindowController.window!.title = "Programmatically"
        
        // create from storyboard
        let storyboardWindowController: NSWindowController = NSStoryboard(name: "WindowController", bundle: nil).instantiateInitialController()!
        storyboardWindowController.window!.title = "Storyboard"
        storyboardWindowController.window!.toolbar = NSToolbar(identifier: "main")
        storyboardWindowController.contentViewController = ContentViewController()
        
        // show windows
        codeWindowController.showWindow(nil)
        storyboardWindowController.showWindow(nil)
    }
}
