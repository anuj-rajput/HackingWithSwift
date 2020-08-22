//
//  ViewController.swift
//  GrandCentralDispatch
//
//  Created by Anuj Rajput on 20/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let credits = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        navigationItem.rightBarButtonItem = credits
        
        let filter = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(promptForSearch))
        navigationItem.leftBarButtonItem = filter
        
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    self?.parse(json: data)
                    return
                }
            }
            
            self?.showError()
        }
    }
    
    func showError() {
        DispatchQueue.main.async { [weak self] in
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(ac, animated: true)
        }
    }
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "Credits", message: "The data comes from We The People API of the Whitehouse", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func promptForSearch() {
        let ac = UIAlertController(title: "Search Petitions", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let search = UIAlertAction(title: "Search", style: .default) { [weak self, weak ac] _ in
            guard let term = ac?.textFields?.first?.text else { return }
            self?.filterPetitions(for: term)
        }
        ac.addAction(search)
        present(ac, animated: true)
    }
    
    func filterPetitions(for term: String) {
        filteredPetitions.removeAll()
        for petition in petitions {
            if petition.title.lowercased().contains(term.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)) || petition.body.lowercased().contains(term.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)) {
                filteredPetitions.append(petition)
            }
        }
        tableView.reloadData()
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            filteredPetitions = petitions
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let petition = filteredPetitions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text  = petition.title
        cell.detailTextLabel?.text  = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let petition = filteredPetitions[indexPath.row]
        let vc = DetailViewController()
        vc.detailItem = petition
        navigationController?.pushViewController(vc, animated: true)
    }
}

