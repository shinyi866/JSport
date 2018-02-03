//
//  MainViewController.swift
//  JS
//
//  Created by apple on 2018/2/3.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    var locdata = ["中正區","萬華區","信義區"]
    var balldata = ["排球","籃球","排球"]
    var peodata = ["2人" ,"3人","1人"]
    
    @IBOutlet var loctext: UITextField!
    @IBOutlet var timetext: UITextField!
    @IBOutlet var numbertext: UITextField!
    
    @IBOutlet var tableview: UITableView!
    
    @IBAction func updateData(_ sender: Any) {
        
        locdata.insert(loctext.text!, at: 0)
        balldata.insert(timetext.text!, at: 0)
        peodata.insert(numbertext.text!, at: 0)
        tableview.reloadData()  //?
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peodata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "MyCell"
        //資源回收桶拿東西
        //as 轉型 cell:UITableViewCell 改成 CustomCell(Table View)
        var cell: SportCell! = tableView.dequeueReusableCell(withIdentifier: cellID) as? SportCell
        //        if cell == nil{
        //            cell = UITableViewCell(style: .default , reuseIdentifier: cellID)
        //        }
        cell?.label1.text = locdata[indexPath.row]
        cell?.label2.text = balldata[indexPath.row]
        cell?.label3.text = peodata[indexPath.row]
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
