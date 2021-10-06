//
//  ToDoTableViewController.swift
//  coredata uikit
//
//  Created by Visakh D on 06/10/21.
//

import UIKit

class ToDoTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}

extension UIViewController : UITableViewDelegate , UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
    return 2
}

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
}

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CellToDoItem") as! CellToDoItem
    return cell
}

}
