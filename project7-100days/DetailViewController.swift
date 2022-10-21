//
//  DetailViewController.swift
//  project7-100days
//
//  Created by Yusuf Ahmet Nihat  Hekimoğlu on 2022-10-20.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView : WKWebView!
    var detailItem: Petition?
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailItem = detailItem else {return}
        let html = """
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style> body { font-size: 150%; } </style>
</head>
<body>
\(detailItem.body)
</body>
</html>
"""
        // to laod your custom html 
       webView.loadHTMLString(html, baseURL: nil)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
