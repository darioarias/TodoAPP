//
//  ViewController.swift
//  Todoey
//
//  Created by Dario Arias on 8/25/18.
//  Copyright © 2018 Dario Arias. All rights reserved.
//

import UIKit

class todoListViewController: UITableViewController {
    var itemArr = ["List one", "List Two", "List Three"]
    
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
    // MARK - Add Item Btn
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textfield = alertTextField
        }
        
        let addItemAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what happens when the user clicks on the Add Item btn
            if textfield.text!.count >= 2 {
                self.itemArr.append(textfield.text!)
                self.tableView.reloadData()
                
            } else {
                // what happens if item cannot be created
                let alert = UIAlertController(title: "Incomplete", message: "Item could not be created", preferredStyle:.alert)
                let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                alert.addAction(dismiss)
                self.present(alert, animated: true, completion:nil)
            }
           
        }
        
        let cancelItemAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            //What happens when the user clicks on Cancel btn
            print("Cancel item clicked!")
            
        }
        
        alert.addAction(cancelItemAction)
        alert.addAction(addItemAction)
        present(alert, animated: true, completion: nil)
    }
    
}



