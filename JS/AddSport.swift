//
//  AddSport.swift
//  JS
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class AddSport: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,CLLocationManagerDelegate{
    
    let locationManger = CLLocationManager()
    var currentloc = Location()
    var countdis:Int = 0
    
    @IBAction func Back(segue: UIStoryboardSegue){
    }
    
   
    @IBOutlet var map: MKMapView!
    
    @IBOutlet var imageview: UIImageView!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var timeField: UITextField!
    @IBOutlet var kindField: UITextField!
    @IBOutlet var distant: UITextField!
    @IBOutlet var distantshow: UILabel!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //info: [String : AnyObject]//傳送者傳遞的資料放這裡
        print("\(info)")
        let image = info["UIImagePickerControllerOriginalImage"]
        imageview.image = image as? UIImage
//        var picdata:[UIImage] = []
//        picdata.append(image as! UIImage)
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func mapAction(_ sender: Any) {
        
        if map.isHidden == true{
            map.isHidden = false
        }
        
        var coordinaiton:CLLocationCoordinate2D = map.userLocation.coordinate//CLLocationCoordinate2DMake(25.0355353, 121.5135416) 
        //Location of Exercise
        if locationField.text == "NTNU"{
            coordinaiton.latitude = currentloc.NTNU_lat
            coordinaiton.longitude = currentloc.NTNU_lng
            countdis = Int(CountDistance(lat: currentloc.NTNU_lat, lng: currentloc.NTNU_lng))
        }else if locationField.text == "NTU"{
            coordinaiton.latitude = currentloc.NTU_lat
            coordinaiton.longitude = currentloc.NTU_lng
            countdis = Int(CountDistance(lat: currentloc.NTU_lat, lng: currentloc.NTU_lng))
        }else if locationField.text == "NTUT"{
            coordinaiton.latitude = currentloc.NTUT_lat
            coordinaiton.longitude = currentloc.NTUT_lng
            countdis = Int(CountDistance(lat: currentloc.NTUT_lat, lng: currentloc.NTUT_lng))
        }else if locationField.text == "NTUA"{
            coordinaiton.latitude = currentloc.NTUA_lat
            coordinaiton.longitude = currentloc.NTUA_lng
            countdis = Int(CountDistance(lat: currentloc.NTUA_lat, lng: currentloc.NTUA_lng))
        }else if locationField.text == "UT"{
            coordinaiton.latitude = currentloc.UT_lat
            coordinaiton.longitude = currentloc.UT_lng
            countdis = Int(CountDistance(lat: currentloc.UT_lat, lng: currentloc.UT_lng))
        }else{}
        
        let pointAnnotation = MKPointAnnotation()
        let mySpan = MKCoordinateSpanMake(0.02, 0.02)
        let toRegion = MKCoordinateRegionMake(coordinaiton, mySpan)
        
        pointAnnotation.coordinate = coordinaiton
        map.setRegion(toRegion, animated: true)
        map.addAnnotation(pointAnnotation)  //add point
        
    }
    
    @IBAction func pickpic(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        }
        
        imagePicker.delegate = self
        present(imagePicker,animated: true,completion: nil)
        
    }
    
    @IBAction func btnSend(_ sender: Any) {
        
        let sportdata = SportData(location:locationField.text! , time:timeField.text! , dis: countdis, pic:imageview.image!)
        //把值傳進SPORT_DATA
        SPORT_DATA.insert(sportdata, at: 0)
        SPORT_DATA.sort(by: { (dis1: SportData, dis2: SportData) -> Bool in return dis1.dis < dis2.dis })
        
        locationField.text = ""
        timeField.text = ""
        //imageview = nil
        distantshow.text = String(countdis)
        print(SPORT_DATA)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //位置請求
        locationManger.requestWhenInUseAuthorization()
        
        //要通知距離走到哪裡 self要在上面加 CLLocationManagerDelegate
        locationManger.delegate = self
        
        //準度
        locationManger.desiredAccuracy = kCLLocationAccuracyKilometer
        
        //移動多少才更新，離開五百公尺之外
        locationManger.distanceFilter = 500
        
        locationManger.startUpdatingLocation()
        if map.isHidden == false{
            map.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        if map.isHidden == false{
            map.isHidden = true
        }
    }
    
    

}
