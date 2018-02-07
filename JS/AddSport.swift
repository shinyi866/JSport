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
    var countdis:Double = 0.0
    var receivestatus:[String] = []
    
//    @IBAction func Back(segue: UIStoryboardSegue){
//    }
    
    
    @IBOutlet var map: MKMapView!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet var imageview: UIImageView!
    @IBOutlet var txt: UITextField!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var timeField: UITextField!
    @IBOutlet var kindField: UITextField!
    @IBOutlet var distant: UITextField!
    @IBOutlet var distantshow: UILabel!
    
    let picker = UIDatePicker()
    
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
        
        var coordinaiton:CLLocationCoordinate2D = map.userLocation.coordinate
        
        if locationField.text == "NTNU"{
            coordinaiton.latitude = currentloc.NTNU_lat
            coordinaiton.longitude = currentloc.NTNU_lng
            countdis = CountDistance(lat: currentloc.NTNU_lat, lng: currentloc.NTNU_lng)
        }else if locationField.text == "NTU"{
            coordinaiton.latitude = currentloc.NTU_lat
            coordinaiton.longitude = currentloc.NTU_lng
            countdis = CountDistance(lat: currentloc.NTU_lat, lng: currentloc.NTU_lng)
        }else if locationField.text == "NTUT"{
            coordinaiton.latitude = currentloc.NTUT_lat
            coordinaiton.longitude = currentloc.NTUT_lng
            countdis = CountDistance(lat: currentloc.NTUT_lat, lng: currentloc.NTUT_lng)
        }else if locationField.text == "NTUA"{
            coordinaiton.latitude = currentloc.NTUA_lat
            coordinaiton.longitude = currentloc.NTUA_lng
            countdis = CountDistance(lat: currentloc.NTUA_lat, lng: currentloc.NTUA_lng)
        }else if locationField.text == "UT"{
            coordinaiton.latitude = currentloc.UT_lat
            coordinaiton.longitude = currentloc.UT_lng
            countdis = CountDistance(lat: currentloc.UT_lat, lng: currentloc.UT_lng)
        }else{}
        if map.isHidden == true{
            map.isHidden = false
        }
        
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
        var statusdata:String = ""
        for i in 0..<receivestatus.count{
            statusdata.append(receivestatus[i])
        }
        let sportdata = SportData(location:locationField.text! , time:timeField.text! , dis: String(format:"%.2f",countdis), pic:imageview.image!, status:statusdata, txt: txt.text!, join: false)
        //把值傳進SPORT_DATA
        SPORT_DATA.insert(sportdata, at: 0)
        SPORT_DATA.sort(by: { (dis1: SportData, dis2: SportData) -> Bool in return dis1.dis < dis2.dis })
        
        locationField.text = ""
        timeField.text = ""
        //imageview = nil
        distantshow.text = String(countdis)
        print(SPORT_DATA)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //座標
        var coordinaiton:CLLocationCoordinate2D = map.userLocation.coordinate//CLLocationCoordinate2DMake(25.0355353, 121.5135416)
        //Location of Exercise
        if locationField.text == "NTNU"{
            coordinaiton.latitude = currentloc.NTNU_lat
            coordinaiton.longitude = currentloc.NTNU_lng
            countdis = CountDistance(lat: currentloc.NTNU_lat, lng: currentloc.NTNU_lng)
        }else if locationField.text == "NTU"{
            coordinaiton.latitude = currentloc.NTU_lat
            coordinaiton.longitude = currentloc.NTU_lng
            countdis = CountDistance(lat: currentloc.NTU_lat, lng: currentloc.NTU_lng)
        }else if locationField.text == "NTUT"{
            coordinaiton.latitude = currentloc.NTUT_lat
            coordinaiton.longitude = currentloc.NTUT_lng
            countdis = CountDistance(lat: currentloc.NTUT_lat, lng: currentloc.NTUT_lng)
        }else if locationField.text == "NTUA"{
            coordinaiton.latitude = currentloc.NTUA_lat
            coordinaiton.longitude = currentloc.NTUA_lng
            countdis = CountDistance(lat: currentloc.NTUA_lat, lng: currentloc.NTUA_lng)
        }else if locationField.text == "UT"{
            coordinaiton.latitude = currentloc.UT_lat
            coordinaiton.longitude = currentloc.UT_lng
            countdis = CountDistance(lat: currentloc.UT_lat, lng: currentloc.UT_lng)
        }else{}
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //date
        createDatePicker()
        timeField.textAlignment = .center
        timeField.placeholder = "請選擇時間"
        
        descriptionTextField.textAlignment = .center
        descriptionTextField.placeholder = "輸入更詳細的邀約內容（例如：人數、場地、詳細狀況等）"
        
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
    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        if map.isHidden == false{
            map.isHidden = true
        }
    }
    
    //date
    func createDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        let done = UIBarButtonItem(barButtonSystemItem: .done, target:nil, action:#selector(donePressed))
        toolbar.setItems([done], animated: false)
        timeField.inputAccessoryView = toolbar
        
        //picker
        timeField.inputView = picker
        
        //format picker
        picker.datePickerMode = .date
    }
    
    //date
    @objc func donePressed(){
        //format date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: picker.date)
        
        //display
        timeField.text = "\(dateString)"
        //picker.date
        self.view.endEditing(true)
    }
}
