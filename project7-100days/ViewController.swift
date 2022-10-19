//
//  ViewController.swift
//  project7-100days
//
//  Created by Yusuf Ahmet Nihat  Hekimoğlu on 2022-10-19.
//

import UIKit

class ViewController: UITableViewController {
var petitions = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text="Title goes Here"
        content.secondaryText="Subtitle goes here"
        cell.contentConfiguration = content
        return cell
    }

}

