//
//  MainViewController.swift
//  JS
//
//  Created by apple on 2018/2/3.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    var locdata: [String] = []
    var timedata:[String] = []
    //var peodata:[String] = []
    
//    var reveiveData_loc:[String] = ["中正區"]
//    var receiveData_ball:[String] = ["排球"]
//    var receiveData_peo:[Int] = [2]
    
    @IBOutlet var loctext: UITextField!
    @IBOutlet var timetext: UITextField!
    @IBOutlet var numbertext: UITextField!
    
    @IBOutlet var tableview: UITableView!
    
    @IBAction func updateData(_ sender: Any) {

//        locdata.insert(loctext.text!, at: 0)
//        balldata.insert(timetext.text!, at: 0)
//        peodata.insert(numbertext.text!, at: 0)
//        tableview.reloadData()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "MyCell"
        //資源回收桶拿東西
        //as 轉型 cell:UITableViewCell 改成 CustomCell(Table View)
        var cell: SportCell! = tableView.dequeueReusableCell(withIdentifier: cellID) as? SportCell
        
        cell?.label1.text = locdata[indexPath.row]
        cell?.label2.text = timedata[indexPath.row]
        //cell?.label3.text = peodata[indexPath.row]
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let outputloc = UserDefaults.standard.object(forKey:"Locatin") as? String{
//            loctext.text = outputloc
//        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        //將reveiveData_loc從Any?轉成String
        if let reveiveData_loc = UserDefaults.standard.object(forKey:KEY_LOCATION) as? String {
            locdata.insert(reveiveData_loc, at: 0)
            //刪除資料
            UserDefaults.standard.removeObject(forKey: KEY_LOCATION)
        }
        if let receiveData_ball = UserDefaults.standard.object(forKey:KEY_TIME) as? String {
            timedata.insert(receiveData_ball, at: 0)
            UserDefaults.standard.removeObject(forKey: KEY_LOCATION)
        }
        tableview.reloadData()
//        if let receiveData_peo = UserDefaults.standard.object(forKey:KEY_LOCATION) as? String {
//            locdata.insert(receiveData_peo, at: 0)
//            UserDefaults.standard.removeObject(forKey: KEY_LOCATION)
//        }
    }
}



