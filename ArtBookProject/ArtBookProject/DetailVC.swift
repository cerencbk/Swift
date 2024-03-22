//
//  DetailVC.swift
//  ArtBookProject
//
//  Created by Ceren ÇABIK on 21.03.2024.
//

import UIKit
import CoreData

class DetailVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ArtistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    var chosenPainting = ""
    var chosenPaintingid : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenPainting != ""{
            
            saveButton.isHidden = false
            saveButton.isEnabled = false
            
            //Core Data
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = chosenPaintingid?.uuidString
            //filtreleme için yani id si ..ya eşit olanı getir
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String {
                            nameText.text = name
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String {
                            ArtistText.text = artist
                        }
                        
                        if let year = result.value(forKey: "year") as? Int {
                            yearText.text = String(year)
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                        
                    }
                }
                
            } catch{
                print("error")
            }
            
            
            
            
        }else{
            saveButton.isHidden = false
            saveButton.isEnabled = false
            nameText.text = ""
            ArtistText.text = ""
            yearText.text = ""
        }
        
        //Recognisers
        
        //klavyeyi boşluğa tıklandığında kapatmak için
        //Recognizers
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    
    
    // görseli ekledikten sonra ne olacak eklemek zorundayız yoksa orda işlem kalır
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
        
        print("hello")
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        //Attributes
        
        newPainting.setValue(nameText.text!, forKey: "name")
        newPainting.setValue(ArtistText.text!, forKey: "artist")
        
        if let year = Int(yearText.text!) {
            newPainting.setValue(year, forKey: "year")
        }
        
        newPainting.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        
        newPainting.setValue(data, forKey: "image")
        
        do {
            try context.save()
            print("success")
        } catch {
            print("error")
        }
        
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    
}
