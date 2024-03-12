//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ceren ÇABIK on 12.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var SimpsoonBookNames = [String()]
    var SimpsoonBookImg = [UIImage()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        SimpsoonBookNames.append("Homer")
        SimpsoonBookNames.append("Marge")
        SimpsoonBookNames.append("Lisa")
        SimpsoonBookNames.append("Bart")
        
        SimpsoonBookImg.append(UIImage(named: "homer.png")!)
        SimpsoonBookImg.append(UIImage(named: "marge.png")!)
        SimpsoonBookImg.append(UIImage(named: "lisa.png")!)
        SimpsoonBookImg.append(UIImage(named: "bart.png")!)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SimpsoonBookNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = SimpsoonBookNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
        
    }


}

