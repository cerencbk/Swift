//
//  ViewController.swift
//  BirthdayApp
//
//  Created by Ceren ÇABIK on 2.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var birthdayLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "Name")
        let storedBirthday = UserDefaults.standard.object(forKey: "Birthday")
        
        if let newName = storedName as? String {
            nameLbl.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String {
            birthdayLbl.text = "Birthday: \(newBirthday)"
        }
    }

    
    
    @IBAction func sadeClicked(_ sender: Any) {
        UserDefaults.standard.set(nameTextField.text!, forKey: "Name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "Birthday")

        nameLbl.text = "Name \(nameTextField.text!)"
        birthdayLbl.text = "Birthday \(birthdayTextField.text!)"
    }

    
    @IBAction func deleteClicked(_ sender: Any) {
        if UserDefaults.standard.object(forKey: "Name") != nil {
            UserDefaults.standard.removeObject(forKey: "Name")
            nameLbl.text = "Name: "
        }
        if UserDefaults.standard.object(forKey: "Birthday") != nil {
            UserDefaults.standard.removeObject(forKey: "Birthday")
            birthdayLbl.text = "Birthday: "
        }
        // Sildikten sonra senkronize etmek gerekli
        UserDefaults.standard.synchronize()
    }

}

