//
//  ViewController.swift
//  Project1
//
//  Created by Anuj Rajput on 28/07/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is the picture to load!
                pictures.append(item)
            }
        }
        
        print(pictures)
    }


}

