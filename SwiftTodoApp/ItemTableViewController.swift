//
//  ItemTableViewController.swift
//  SwiftTodoApp
//
//  Created by Anita Santoso on 1/04/2015.
//  Copyright (c) 2015 AS. All rights reserved.
//

import UIKit

class ItemTableViewController : UITableViewController {
    
    let inputCellId = "inputCell"
    let defaultCellId = "defaultCell"
    
    var items:[String] = ["Buy milk", "Go to the gym", "Cook dinner"]
    var fileCoordinator = NSFileCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad();
        fetchItems();
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count + 1;
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        switch(indexPath.row) {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier(inputCellId) as InputTableViewCell;
            if let inputCell = cell as? InputTableViewCell {
                inputCell.onReturnHandler({ (text:String?) -> Void in
                    if let value = text {
                        self.items.append(value)
                        self.tableView.reloadData()
                    }
                })
            }
            
        default:
            cell = tableView.dequeueReusableCellWithIdentifier(defaultCellId) as? UITableViewCell;
            cell?.textLabel?.text = items[indexPath.row-1];
        }
        return cell!;
    }
    
    private func fetchItems() {
        // TODO
    }
}
