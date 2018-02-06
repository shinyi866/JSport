//
//  SettingViewController.swift
//  JS
//
//  Created by 郭 芷瑄 on 2018/2/6.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var selfDescription: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    

//    @IBAction func pickpic(_ sender: Any) {
//        let imagePicker = UIImagePickerController()
//        
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            imagePicker.sourceType = .camera
//        }
//        
//        imagePicker.delegate = self
//        present(imagePicker,animated: true,completion: nil)
//    }

    
    //birthday
    let picker = UIDatePicker()
    //date
    func createDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        let done = UIBarButtonItem(barButtonSystemItem: .done, target:nil, action:#selector(donePressed))
        toolbar.setItems([done], animated: false)
        birthday.inputAccessoryView = toolbar
        
        //picker
        birthday.inputView = picker
        
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
        birthday.text = "\(dateString)"
        //picker.date
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //date
        createDatePicker()
        
        //location
        pickerView.delegate = self
        pickerView.dataSource = self
        location.inputView = pickerView
        

        //placeholder
        selfDescription.textAlignment = .center
        selfDescription.placeholder = "輸入自我介紹吧：）"
        selfDescription.setValue(UIColor.black, forKeyPath: "_placeholderLabel.textColor")
        
        name.textAlignment = .center
        name.placeholder = "輸入姓名"
        name.setValue(UIColor.black, forKeyPath: "_placeholderLabel.textColor")
        
        birthday.textAlignment = .center
        birthday.placeholder = "Jan 1, 1960"
        birthday.setValue(UIColor.black, forKeyPath: "_placeholderLabel.textColor")
        
        location.textAlignment = .center
        location.placeholder = "台北"
        location.setValue(UIColor.black, forKeyPath: "_placeholderLabel.textColor")
        
        
    }
    
    //location
    let distincts = ["中正區", "大同區", "中山區", "松山區", "大安區", "萬華區", "信義區", "士林區", "北投區", "內湖區", "南港區", "文山區"]
    var pickerView = UIPickerView()
    

    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return distincts.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return distincts[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        location.text = distincts[row]
        location.resignFirstResponder()
    }
   



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
