//
//  WindowController.swift
//  SidebarSeparatorApp
//
//  Created by 1024jp on 2024-09-10.
//

import AppKit

final class WindowController: NSWindowController, NSWindowDelegate {
    
    init() {
        
        let window = NSWindow(contentViewController: ContentViewController())
        window.styleMask.update(with: .fullSizeContentView)
        window.titlebarSeparatorStyle = .automatic
        
        let toolbar = NSToolbar(identifier: "main")
        window.toolbarStyle = .unified
        window.toolbar = toolbar
        
        super.init(window: window)
        
        window.delegate = self
    }
    
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
