//
//  DetailViewController.swift
//  WhitehousePetitions
//
//  Created by Anuj Rajput on 14/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> p { font-size: 200%; } </style>
        <body>
        <h1>\(detailItem.title)</h1>
        <br>
        <p>\(detailItem.body)</p>
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    
}
