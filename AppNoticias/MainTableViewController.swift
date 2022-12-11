//
//  ViewController.swift
//  AppNoticias
//
//  Created by Antonio Vuono on 10/12/22.
//

import UIKit

class MainViewController: UITableViewController {
   

    var items = ["Brasil", "Argentina", "Marrocos", "Croacia", "Inglaterra", "França", "Holanda"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Show my indexpath ----> \(indexPath.row)")
    }
}

