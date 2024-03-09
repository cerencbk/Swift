//
//  ViewController.swift
//  Timer
//
//  Created by Ceren ÇABIK on 9.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timeLbl: UILabel!
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
            counter = 10
            timeLbl.text = "Time: \(counter)"
            
        
        // bu fonsiyonu ekranda 10 dan geriye saymak için kullandık
         //   sleep fonsiyonu kullansaydık ekranda gözükmediği için ekranda saniyelik olarak uyutacak fakat ekranda da bu uyutmanın sonucunu görmek için sleep kullandık ve iiçnde de selectör kullandık ki içerisine şatlar ekledik
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
    
    
    @objc func timerFunction(){
        timeLbl.text = "Timer: \(counter)"
        counter -= 1
        
        if counter == 0 {
            //invaidate fonsiyonu durdurmaya yarıyor
            timer.invalidate()
            timeLbl.text = "Time's Over"
        }
        
        
    }

    
    @IBAction func buttonClicked(_ sender: Any) {
        
        print("clicked")
    }
    

}

