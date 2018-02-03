//
//  CreateEventViewController.swift
//  JS
//
//  Created by 郭 芷瑄 on 2018/2/3.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    
    
    let picker = UIDatePicker()
    let cities = ["中正區","大同區","中山區", "松山區", "大安區", "萬華區", "信義區", "士林區", "北投區", "內湖區", "南港區", "文山區"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //date
        createDatePicker()
        dateField.textAlignment = .center
        dateField.placeholder = "請選擇時間"
        
        //place
        pickerView.delegate = self
        pickerView.dataSource = self
        
        cityField.inputView = pickerView
        cityField.textAlignment = .center
        cityField.placeholder = "請選擇區域"
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityField.text = cities[row]
        cityField.resignFirstResponder()
    }
    
    
    //date
    func createDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        let done = UIBarButtonItem(barButtonSystemItem: .done, target:nil, action:#selector(donePressed))
        toolbar.setItems([done], animated: false)
        dateField.inputAccessoryView = toolbar
        
        //picker
        dateField.inputView = picker
        
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
        dateField.text = "\(dateString)"
        //picker.date
        self.view.endEditing(true)
    }
    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

