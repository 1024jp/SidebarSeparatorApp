//
//  WindowController.swift
//  SidebarSeparatorApp
//
//  Created by 1024jp on 2024-09-10.
//

import AppKit

final class WindowController: NSWindowController, NSWindowDelegate {
    
    init(viewController: NSViewController) {
        
        let window = NSWindow(contentViewController: viewController)
        window.styleMask.update(with: .fullSizeContentView)
        window.titlebarSeparatorStyle = .automatic
        window.animationBehavior = .documentWindow
        
        window.toolbar = NSToolbar(identifier: "main")
        window.titlebarSeparatorStyle = .automatic
        
        super.init(window: window)
        
        window.delegate = self
    }
    
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
    }
}
