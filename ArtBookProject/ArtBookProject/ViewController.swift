//
//  ViewController.swift
//  ArtBookProject
//
//  Created by Ceren ÇABIK on 21.03.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nameArray = [String]()
    var idArray = [UUID]()
    var selectedPainting = ""
    var selectedPaintingid : UUID?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //En üst bara artı tuşu eklemek için
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        getData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }
    
    
    @objc func getData() {
        
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                                if let name = result.value(forKey: "name") as? String {
                                    self.nameArray.append(name)
                                }
                                
                                if let id = result.value(forKey: "id") as? UUID {
                                    self.idArray.append(id)
                                }
                                
                                self.tableView.reloadData()
                                
                            }
            }
            

        } catch {
            print("error")
        }
        
    }

    
    //Artı tuşuna basıldığında Segue yi yöblendirmek için
    @objc func addButtonClicked(){
        selectedPainting = ""
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    
    //segue 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailVC
            destinationVC.chosenPainting = selectedPainting
            destinationVC.chosenPaintingid = selectedPaintingid
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPainting = nameArray[indexPath.row]
        selectedPaintingid = idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
        
    }
    
    
    //Silme işlemi için kullanıcının ne işlem yaptığını algılıyor
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //core data dan verilere erişmek için
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = idArray[indexPath.row].uuidString
            //filtreleme için yani id si ..ya eşit olanı getir
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            
            //silme işleminin asıl gerçekleşmesi
            do {
                let results = try context.fetch(fetchRequest)
                    if results.count > 0 {
                        for result in results as! [NSManagedObject]{
                            if let id = result.value(forKey: "id") as? UUID{
                                if id == idArray[indexPath.row] {
                                    context.delete(result)
                                    nameArray.remove(at: indexPath.row)
                                    idArray.remove(at: indexPath.row)
                                    self.tableView.reloadData()
                                    
                                    
                                    do {
                                        try context.save()
                                        
                                    } catch{
                                        print("error")
                                    }
                                    
                                    print("deleted")
                                    break
                                }
                            }
                        }
                    }
                
            }catch {
                print("error")
            }
            
            
        } else if editingStyle == .insert {
            // Burada, hücre ekleme işlemini gerçekleştirin.
        }
    }

    
    
}
