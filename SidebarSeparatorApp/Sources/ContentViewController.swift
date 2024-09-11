//
//  ContentViewController.swift
//  SidebarSeparatorApp
//
//  Created by 1024jp on 2024-09-10.
//

import AppKit

final class ContentViewController: NSSplitViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.splitViewItems = [
            NSSplitViewItem(sidebarWithViewController: SidebarViewController()),
            NSSplitViewItem(viewController: NSViewController()),
        ]
    }
}

