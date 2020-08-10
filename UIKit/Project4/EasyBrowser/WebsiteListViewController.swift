//
//  WebsiteListViewController.swift
//  EasyBrowser
//
//  Created by Anuj Rajput on 10/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import UIKit

class WebsiteListViewController: UITableViewController {
    var websites = ["apple.com", "anujrajput.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Websites"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebsiteCell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let website = URL(string: "https://\(websites[indexPath.row])")!
        navigationController?.pushViewController(ViewController(with: website), animated: true)
    }
    

}
