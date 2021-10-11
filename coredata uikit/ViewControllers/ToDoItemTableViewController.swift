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
    
//    passing data to the cell to show in the table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemTableViewCell", for: indexPath) as! ToDoItemTableViewCell
        
//        cell.textLabel?.text = store?[indexPath.row].title
                cell.cellTitle?.text = store?[indexPath.row].title
                cell.cellContent?.text = store?[indexPath.row].content
        
        return cell
    }
    
    
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
    
    
    //    edit cell functions like delete and edit
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let Delete = UIContextualAction(style: .destructive, title: "Delete", handler: {_,_,_  in
            
            
            let cell = self.store?.remove(at: indexPath.row)
            
            self.deleteAlert(cell:cell!)
           
        })
        let Edit = UIContextualAction(style: .destructive, title: "Edit", handler: {_,_,_  in
            
            
            let cell = self.store?[indexPath.row]
            
            self.editActionSheet(cell:cell!)
        })
        Edit.backgroundColor = .systemBlue
        let swipeActConfig = UISwipeActionsConfiguration(actions: [Delete , Edit])
        
        return swipeActConfig
    }
    
    
//    delete cell  function
    
    func deleteAlert(cell:ToDoItem)  {
        let alert =  UIAlertController(title: "Delete Cell", message:"Do You Want To DELETE Item", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete Cell", style: .destructive, handler: {(handler) in
            CoreData.shared.deleteToDoItem(item: cell)
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(handler) in  }))
        self.present(alert, animated: true , completion: nil)
    }
    
//    edit cell function using alert 
    func editActionSheet(cell:ToDoItem)  {
        let alert =  UIAlertController(title: "Edit Cell", message:"Do You Want To Edit Item", preferredStyle: .alert)
        
        alert.addTextField { textfield in
            textfield.placeholder = "EditTitle"}
        alert.addTextField { contfield in
            contfield.placeholder = "EditContent"}
        
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: {(handler) in
            let textfield = alert.textFields
            CoreData.shared.updateToDoItem(item: cell, newtitle:textfield![0].text! , newcontent: "")
            self.tableView.reloadData()
        })
    )
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(handler) in  }))
    
    self.present(alert, animated: true , completion: nil)
}

}
