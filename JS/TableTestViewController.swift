//
//  TableTestViewController.swift
//  JS
//
//  Created by apple on 2018/2/3.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class TableTestViewController: UIViewController ,UITableViewDataSource {

    var data:[String] = ["1","2","3"]
    
    @IBOutlet var inputField: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBAction func updateDat(_ sender: Any) {
        //        data.append(inputField.text!)
        data.insert(inputField.text!, at: 0)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("selected cell")
        var cell = tableView.cellForRow(at: indexPath)
    }
    
    
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
//    }
//    //
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellID = "MyCell"
//        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID)
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
//        }
//        cell?.textLabel?.text = data[indexPath.row]
//        return cell!
//    }
    
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
