//
//  Notice.swift
//  JS
//
//  Created by apple on 2018/2/6.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit
import Firebase

class Notice: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    //var receivejoin: SportDatatest?
    @IBOutlet var noticetable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SPORT_DATA.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "NoticeCell1"
        let cell: NoticeCell? = tableView.dequeueReusableCell(withIdentifier: cellID) as? NoticeCell
        
        if SPORT_DATA[indexPath.row].join == true{
        
        cell?.label1.text = SPORT_DATA[indexPath.row].location
        cell?.label2.text = SPORT_DATA[indexPath.row].time
            
        }else{
            cell?.label1.text = ""
            cell?.label2.text = ""
        }
        
        return cell!
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.noticetable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
