//
//  MainViewController.swift
//  JS
//
//  Created by apple on 2018/2/3.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
//    var locdata: [String] = []
    var timedata = ["1","2","3"]

    @IBOutlet var tableview: UITableView!
    
    @IBAction func finish(_ sender: Any) {

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SPORT_DATA.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "MyCell"
        //資源回收桶拿東西
        //as 轉型 cell:UITableViewCell 改成 CustomCell(Table View)
        let cell: SportCell! = tableView.dequeueReusableCell(withIdentifier: cellID) as? SportCell
        
        cell?.label1.text = SPORT_DATA[indexPath.row].location
        cell?.label2.text = SPORT_DATA[indexPath.row].time
        cell?.label3.text = String(SPORT_DATA[indexPath.row].dis)
        cell?.label4.text = SPORT_DATA[indexPath.row].status
        cell?.imageview.image = SPORT_DATA[indexPath.row].pic
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detial = storyboard?.instantiateViewController(withIdentifier: "Information") as! Information        
        detial.infolocation = SPORT_DATA[indexPath.row].location
        detial.infotime = SPORT_DATA[indexPath.row].time
        detial.infostatus = SPORT_DATA[indexPath.row].status
        detial.infopic = SPORT_DATA[indexPath.row].pic
        detial.infotxt = SPORT_DATA[indexPath.row].txt
        detial.infojoin = SPORT_DATA[indexPath.row].join
        
        print(detial)
        navigationController?.pushViewController(detial, animated: true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    //增加動態就改變資料
    override func viewDidAppear(_ animated: Bool) {
        //將reveiveData_loc從Any?轉成String
//        if let reveiveData_loc = UserDefaults.standard.object(forKey:KEY_LOCATION) as? String {
//            SportData.locdata.insert(reveiveData_loc, at: 0)
//            //刪除資料
//            UserDefaults.standard.removeObject(forKey: KEY_LOCATION)
//        }
//        if let receiveData_ball = UserDefaults.standard.object(forKey:KEY_TIME) as? String {
//            SportData.timedata.insert(receiveData_ball, at: 0)
//            UserDefaults.standard.removeObject(forKey: KEY_LOCATION)
//        }
        
        tableview.reloadData()

    }
}



