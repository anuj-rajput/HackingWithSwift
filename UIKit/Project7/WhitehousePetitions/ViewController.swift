//
//  ViewController.swift
//  WhitehousePetitions
//
//  Created by Anuj Rajput on 14/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text  = "Title goes here"
        cell.detailTextLabel?.text  = "Subtitle goes here"
        return cell
    }
}
