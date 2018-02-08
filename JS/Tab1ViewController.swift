//
//  Tab1ViewController.swift
//  JS
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class Tab1ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{
        
        //    var locdata: [String] = []
        //    var timedata:[String] = []
    
//    @IBOutlet var loctext: UITextField!
//        @IBOutlet var timetext: UITextField!
//        @IBOutlet var numbertext: UITextField!
    
    
    @IBOutlet var tableview: UITableView!
    
    @IBAction func updateData(_ sender: Any) {
            
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SPORT_DATA.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "MyCell2"
        //資源回收桶拿東西
        //as 轉型 cell:UITableViewCell 改成 CustomCell(Table View)
        let cell: SportCell1! = tableView.dequeueReusableCell(withIdentifier: cellID) as? SportCell1
        
        cell?.label1.text = SPORT_DATA[indexPath.row].location
        cell?.label2.text = SPORT_DATA[indexPath.row].time
        cell?.label3.text = String(SPORT_DATA[indexPath.row].dis)
        cell?.label4.text = SPORT_DATA[indexPath.row].status
        cell?.pic.image = SPORT_DATA[indexPath.row].pic
            return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            
    }
    override func viewDidAppear(_ animated: Bool) {
        tableview.reloadData()
    }
}


