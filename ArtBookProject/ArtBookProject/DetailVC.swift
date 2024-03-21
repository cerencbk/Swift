//
//  DetailVC.swift
//  ArtBookProject
//
//  Created by Ceren ÇABIK on 21.03.2024.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ArtistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UIGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        print("Test")
    }
    

    
}
