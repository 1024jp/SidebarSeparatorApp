//
//  SidebarViewController.swift
//  SidebarSeparatorApp
//
//  Created by 1024jp on 2024-09-10.
//

import AppKit

final class SidebarViewController: NSViewController {

    @ViewLoading private var outlineView: NSOutlineView
    
    
    override func loadView() {
        
        let outlineView = NSOutlineView()
        outlineView.headerView = nil
        outlineView.addTableColumn(NSTableColumn())
        
        let scrollView = NSScrollView()
        scrollView.documentView = outlineView
        scrollView.drawsBackground = false
        
        self.view = NSView()
        self.view.addSubview(scrollView)
        
        self.outlineView = outlineView
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.outlineView.delegate = self
        self.outlineView.dataSource = self
    }
}




// MARK: Outline View Data Source

extension SidebarViewController: NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        
        30
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        
       false
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        
        "Item \(index + 1)"
    }
}


// MARK: Outline View Delegate

private extension NSUserInterfaceItemIdentifier {
    
    static let text = NSUserInterfaceItemIdentifier("text")
}


extension SidebarViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        
        let cellView = outlineView.makeView(withIdentifier: .text, owner: self) as? NSTableCellView ?? self.createCellView()
        
        cellView.textField!.stringValue = item as! String
        
        return cellView
    }
    
    
    private func createCellView() -> NSTableCellView {
        
        let textField = NSTextField(labelWithString: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let cellView = NSTableCellView()
        cellView.identifier = .text
        cellView.addSubview(textField)
        cellView.textField = textField
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 2),
            textField.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -2),
        ])
        
        return cellView
    }
}
