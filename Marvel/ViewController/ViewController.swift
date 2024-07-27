//
//  ViewController.swift
//  Marvel
//
//  Created by iOS Lab on 22/06/24.
//

import UIKit

class ViewController: UIViewController {
    private let apiManager = APINetwork()
    var lastIndexSelected: Int?
    var heroes: [Hero] = [Hero(name: "Hulk", image: UIImage(), description: "Hulk muito forte"),
                          Hero(name: "Homem de ferro", image: UIImage(), description: "Homem de ferro é rico"),
                          Hero(name: "Homem Aranha", image: UIImage(), description: "Aranha é aventureiro")]
    
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.getHeroes { heroes in
        
        } onError: { error in
        
        }

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
}
