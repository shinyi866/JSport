//
//  Noticetest.swift
//  JS
//
//  Created by apple on 2018/2/7.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class Noticetest: UIViewController {
    
    var data1:SportData!
    var noticejoin:Bool = false
    
    @IBOutlet var input1: UITextField!
    @IBOutlet var input2: UITextField!
    @IBOutlet var output1: UILabel!
    @IBOutlet var output2: UILabel!
    
    @IBAction func join(_ sender: Any) {
//        data1 = SportData(location:input1.text!,time:input2.text!,join:false)
        
        SPORT_DATA.insert(data1, at: 0)
        
        input1.text = ""
        input2.text = ""
        
        output1.text = data1.location
        output2.text = data1.time
        
        
    }
    @IBAction func join2(_ sender: Any) {
    }
    
    @IBAction func ok1(_ sender: Any) {
        data1.join = true
        //noticejoin = data1.join
        print(data1.join)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//        let sportdata = SportDatatest(location: "Yo", time: "12:30", join: true)
//        print(sportdata.join)
//
//        sportdata.join = false
//        print(sportdata.join)
//    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    

}
