//
//  ViewController.swift
//  ArtBookProject
//
//  Created by Ceren ÇABIK on 21.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //En üst bara artı tuşu eklemek için
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        
    }
    
    //Artı tuşuna basıldığında Segue yi yöblendirmek için
    @objc func addButtonClicked(){
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    

 
}

