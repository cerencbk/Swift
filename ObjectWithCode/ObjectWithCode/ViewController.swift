//
//  ViewController.swift
//  ObjectWithCode
//
//  Created by Ceren ÇABIK on 1.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        let myLabel = UILabel()
        myLabel.text = "Text Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x:width * 0.5 - width * 0.8 / 2 , y:width * 0.5 , width: width * 0.8 , height: width * 0.5)
        view.addSubview(myLabel)
        
    }


}

