//
//  ToDoItemTableViewController.swift
//  coredata uikit
//
//  Created by Visakh D on 08/10/21.
//

import UIKit



class ToDoItemTableViewController: UITableViewController {
    
    var titletable = ["Todoitems","Completed"]
    var store : [ToDoItem]?
 
   
    
    @IBOutlet var toDoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoTable.dataSource = self
        toDoTable.delegate = self
        
        store = CoreData.shared.getToDoItem()
        
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMaker", for: indexPath)
       
        cell.textLabel?.text = store?[indexPath.row].title
          
        
        return cell
    }
   
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return titletable[section]
//
//
//    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark
       {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
       }
        else
       {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
       }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 15, y: 0, width: view.frame.width , height: 40))
        view.backgroundColor = .systemTeal
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        lbl.text = titletable[section]
        view.addSubview(lbl)
        return view
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
