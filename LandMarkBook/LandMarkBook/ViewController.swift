//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Ceren ÇABIK on 10.03.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var landMarkNames = [String()]
    var landmarkImages = [UIImage()]
    
    var chosenLandmarkName = ""
    var chosenLandmarkImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Yukarıda eklemek yeterli değil düzgün çalışması için buraya da eklememeiz gerekiyor
        tableView.delegate = self
        tableView.dataSource = self
        
        

        landMarkNames.append("Coliseum")
        landMarkNames.append("Great Wall")
        landMarkNames.append("Kremlin")
        landMarkNames.append("Stonhenge")
        landMarkNames.append("Taj Mahal")
        

        landmarkImages.append(UIImage(named: "coliseum.jpeg")!)
        landmarkImages.append(UIImage(named: "wall.jpeg")!)
        landmarkImages.append(UIImage(named: "klemlin.jpeg")!)
        landmarkImages.append(UIImage(named: "henge.jpeg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpeg")!)

    }
    //didload end

    //Viewcontrollerların yaına eklediğimiz için bu iki protekolleri eklemek zorundayız
    // num ve cell yazarak oluşturuyoruz
    
    //Kaç tane girdi olduğunu soruyor
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
    
    //Ne göstereceğini soruyor. Hücrelerde ne verisi oluşacak
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test"  bu kalkacağı için altındakiler yazılabilir
        
        //İçerik ayarlayıcısı
        var content = cell.defaultContentConfiguration()
        content.text = landMarkNames[indexPath.row] // yukarıda verilen değişkenin ismini buraya yazıyoruz ve yanına eklediğimiz row da dizilerdeki index matığı çalışarak yazdıklarımızın gösterilmwsini sağlıyor
        cell.contentConfiguration = content
        return cell
    }
    
    
    //Bir row yani hücrenin bir sırası çeçildiğinde ne yapılması gerektiği
    //didselect diyerek aranabilir
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandmarkName = landMarkNames[indexPath.row]
        chosenLandmarkImages = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    
    // Segue yi yönlendirme işlemi
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destiationVC = segue.destination as! DetailVC
            destiationVC.selectedLandName = chosenLandmarkName
            destiationVC.selectedLandImage = chosenLandmarkImages
        }
    }
    
    
    //verileri silmek için
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landMarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

