//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Ceren ÇABIK on 10.03.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Yukarıda eklemek yeterli değil düzgün çalışması için buraya da eklememeiz gerekiyor
        tableView.delegate = self
        tableView.dataSource = self
    }
    //didload end

    //Viewcontrollerların yaına eklediğimiz için bu iki protekolleri eklemek zorundayız
    // num ve cell yazarak oluşturuyoruz
    
    //Kaç tane girdi olduğunu soruyor
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //Ne göstereceğini soruyor. Hücrelerde ne verisi oluşacak
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        cell.textLabel?.text = "test"  bu kalkacağı için altındakiler yazılabilir
        
        //İçerik ayarlayıcısı
        var content = cell.defaultContentConfiguration()
        content.text = "TableView"
        cell.contentConfiguration = content
        return cell
    }

}

