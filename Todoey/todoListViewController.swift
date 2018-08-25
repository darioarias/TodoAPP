//
//  ViewController.swift
//  Todoey
//
//  Created by Dario Arias on 8/25/18.
//  Copyright © 2018 Dario Arias. All rights reserved.
//

import UIKit

class todoListViewController: UITableViewController {
    let itemArr = ["List one", "List Two", "List Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - TableView Datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
//        let cell = UITableViewCell(style:.default, reuseIdentifier: "ToDoItemCell")
        
        cell.textLabel?.text = itemArr[indexPath.row]
        return cell
    }
    
    //MARK - TableView delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArr[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}



