//
//  DetailVC.swift
//  LandMarkBook
//
//  Created by Ceren ÇABIK on 10.03.2024.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var landMarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    //Viewcontroller dan bir değişiklik yapıldığı zaman buradan değişmesini istediğimiz için
    var selectedLandName = " "
    var selectedLandImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landMarkLabel.text = selectedLandName
        imageView.image = selectedLandImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
