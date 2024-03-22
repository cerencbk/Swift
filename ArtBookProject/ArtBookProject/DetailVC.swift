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
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        self.dismiss(animated: true, completion: nil)
        
        print("hello")
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let appDelegeta = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegeta.persistentContainer.viewContext
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        //Attribute
        newPainting.setValue(nameText.text!, forKey: "name")
        newPainting.setValue(ArtistText.text, forKey: "artist")
        
        if let year = Int(yearText.text!){
            newPainting.setValue(year, forKey: "year")
        }
        
        newPainting.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)   //Görseli data olarak eklemek için
        newPainting.setValue(data, forKey: "image")
        
        do {
            try context.save()
            print("Succes")
        } catch {
           print("error")
        }
    }
    

    
}
