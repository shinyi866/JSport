//
//  SettingViewController.swift
//  JS
//
//  Created by 郭 芷瑄 on 2018/2/6.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UICollectionViewDataSource , UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    /////////////////////////////////////////
    var data:[[(String,Bool)]] = []
    var datatest:[String] = []
    @IBOutlet weak var LGCell: UICollectionView!
    ///////////////////////////////////////////
    
    @IBOutlet weak var selfDescription: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func finish(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeVC")
        self.present(vc!, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //info: [String : AnyObject]//傳送者傳遞的資料放這裡
        print("\(info)")
        let image = info["UIImagePickerControllerOriginalImage"]
        imageView.image = image as? UIImage
        //        var picdata:[UIImage] = []
        //        picdata.append(image as! UIImage)
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func pickpic(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        }
        
        imagePicker.delegate = self
        present(imagePicker,animated: true,completion: nil)
    }

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
        
        ////////////////////
        self.data = [["籃球 ","排球 ","棒球 ","壘球 ","足球 ","慢跑 ","羽球 ","健身 ","桌球 ","撞球 ","網球 ","高爾夫球 ","其他球類 ","其他運動 ","不限 "].map({str in return (str,false)})]
        /////////////////////
        
        
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
    //////////
    ////////////
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.data[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(20, 1, 20, 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:Sport2Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GLCell1", for: indexPath) as! Sport2Cell
        cell.cell.text = data[indexPath.section][indexPath.row].0
        
        //custom cell
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellToDeselect:UICollectionViewCell = LGCell.cellForItem(at: indexPath)!
        
        if data[indexPath.section][indexPath.row].1 {
            cellToDeselect.contentView.backgroundColor = UIColor.gray  //改btn按鈕取消
            data[indexPath.section][indexPath.row].1 = false
        }else{
            //btnselect = true
            cellToDeselect.contentView.backgroundColor = UIColor.orange  //改btn按鈕選上
            data[indexPath.section][indexPath.row].1 = true
        }
        
        print("select item \(indexPath.row)")
        datatest.removeAll()  //先將array清空再一次將true放入array
        for i in 0..<data.count {
            for j in 0..<data[i].count{
                if data[i][j].1 == true{
                    datatest.append(data[i][j].0)
                }
            }
        }
        
        print(datatest)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        LGCell.reloadData()
    }
    
//    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
//
//        let sportstatus = segue.destination as! AddSport
//        for i in 0..<datatest.count{
//            sportstatus.receivestatus.append(datatest[i])
//        }
//
//    }
    
    
}
