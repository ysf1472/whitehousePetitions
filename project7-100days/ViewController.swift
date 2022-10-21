//
//  ViewController.swift
//  project7-100days
//
//  Created by Yusuf Ahmet Nihat  Hekimoğlu on 2022-10-19.
//

import UIKit


class ViewController: UITableViewController {
var petitions = [Petition]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString : String
        
            if navigationController?.tabBarItem.tag==0{
                urlString="https://www.hackingwithswift.com/samples/petitions-1.json"
            }else{
                urlString="https://www.hackingwithswift.com/samples/petitions-2.json"
            }
           
        
        DispatchQueue.main.async { [self] in
            if let url = URL(string: urlString){
                if let data = try? Data(contentsOf: url){
                    parse(json: data)
                    return
                }
            }
                showError()
                
            
        }
    }
    func showError(){
        let ac = UIAlertController(title: "Loading Error", message: "There was a problem loading the feed, please check your connection and try again", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Okay", style: .default))
        present(ac,animated: true)
    }
    func parse(json: Data){
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
            
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        let petition = petitions[indexPath.row]
//        cell.textLabel?.text=petition.title
//        cell.detailTextLabel?.text=petition.body
        var content = cell.defaultContentConfiguration()
        content.text=petition.title
        content.secondaryText=petition.body
        content.textProperties.numberOfLines = 2
        content.secondaryTextProperties.numberOfLines = 1
        
        cell.contentConfiguration = content
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

