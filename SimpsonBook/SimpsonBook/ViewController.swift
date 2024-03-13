//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ceren ÇABIK on 12.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var mySimpson = [Simpsoon]()
    var chosenSimpson : Simpsoon?
    
    var SimpsoonBookNames = [String()]
    var SimpsoonBookImg = [UIImage()]
    var SimpsoonBookJob = [String()]
    
    class simpsoon {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let homer = Simpsoon(simpsonName: "Homer", simpsonJob: "Nuclear Safety", simpsonImage: UIImage(named: "homer.png")!)
        let marge = Simpsoon(simpsonName: "Marge", simpsonJob: "HouseWife", simpsonImage: UIImage(named: "marge.png")!)
        let bart = Simpsoon(simpsonName: "Bart", simpsonJob: "Student", simpsonImage: UIImage(named: "bart.png")!)
        let lisa = Simpsoon(simpsonName: "Lisa", simpsonJob: "Student", simpsonImage: UIImage(named: "lisa.png")!)
        
        mySimpson.append(homer)
        mySimpson.append(marge)
        mySimpson.append(bart)
        mySimpson.append(lisa)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return mySimpson.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = UITableViewCell()
           cell.textLabel?.text = mySimpson[indexPath.row].name
           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpson[indexPath.row]
        self.performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! detailVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }


}

