//
//  ViewController.swift
//  travelBook
//
//  Created by Ceren ÇABIK on 23.03.2024.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var chosenLatutute = Double()
    var chosenLongitute = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        // Lokasyonun keskinliği için
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()//kullanıcıdan kullanım izni(uygulamayı kullanırken)
        locationManager.startUpdatingLocation()
        
        
        let gestureRecogniser = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecogniser:)))
        gestureRecogniser.minimumPressDuration = 2
        mapView.addGestureRecognizer(gestureRecogniser)
        
        
    }
    
    @objc func chooseLocation(gestureRecogniser : UILongPressGestureRecognizer) {
        // GestureRecogniser işlemi başladıysa dokunulan yeri almak için kontrol
        if gestureRecogniser.state == .began {
            //dokunulan kordinatları bu lısım veriyor
            let toucPoint = gestureRecogniser.location(in: self.mapView)
            let touchCordinate = self.mapView.convert(toucPoint, toCoordinateFrom: self.mapView)
            
            chosenLatutute = touchCordinate.latitude
            chosenLongitute = touchCordinate.longitude
            
            
            //pin ekleme
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchCordinate
            annotation.title = nameText.text
            annotation.subtitle = commentText.text
            self.mapView.addAnnotation(annotation)
        }
        
    }

    //güncellenen lokasyonları dizi şeklinde veriyor. CLLocation objesi veriyor dizi olarak
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //kullanıcın bulunduğu yere zoom için
        let locations = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locations, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contex = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: contex)
        newPlace.setValue(nameText.text, forKey: "tite")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(chosenLatutute, forKey: "latitude")
        newPlace.setValue(chosenLongitute, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try contex.save()
            print("saved")
            
        } catch {
            print("error")
        }
        
        
    }
    

}

