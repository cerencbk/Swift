//
//  ViewController.swift
//  AlertProject
//
//  Created by Ceren ÇABIK on 3.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupClicked(_ sender: Any) {
//        let alert = UIAlertController(title: "Error!", message: "User Name Not Found", preferredStyle: UIAlertController.Style.alert)
//        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { UIAlertAction in
////            Button clicked
//            print("Button Clicked")
//        }
//        alert.addAction(okButton)
//        self.present(alert, animated: true, completion: nil)
        
        if usernameText.text == "" {makeAlert(titileInput: "Error", messageInput: "User Name do not found")}
        else if passwordText.text == "" {makeAlert(titileInput: "Error", messageInput: "Password do not found!")}
        else if passwordText.text != password2Text.text{makeAlert(titileInput: "Error", messageInput: "Password do not match!")}
        else {makeAlert(titileInput: "Succes", messageInput: "User Ok")}
        
    }
    
    func makeAlert (titileInput: String, messageInput: String){
        let alert = UIAlertController(title: titileInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    


}

