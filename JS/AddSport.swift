//
//  AddSport.swift
//  JS
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

let KEY_LOCATION = "Location"
let KEY_TIME = "Time"

class AddSport: UIViewController {
    
    var myUserDefaults : UserDefaults!
    
    @IBOutlet var locationField: UITextField!
    @IBOutlet var timeField: UITextField!
    @IBOutlet var kindField: UITextField!
    
    @IBOutlet var loc: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var kind: UILabel!
    @IBOutlet var num: UILabel!
    
    @IBAction func btnSend(_ sender: Any) {
        UserDefaults.standard.set(locationField.text, forKey: KEY_LOCATION)
        locationField.text = ""
        
        if let outputloc = UserDefaults.standard.object(forKey:KEY_LOCATION) as? String{
            loc.text = outputloc
        }
        
        UserDefaults.standard.set(timeField.text, forKey: KEY_TIME)
        timeField.text = ""
        
        if let outputtime = UserDefaults.standard.object(forKey:KEY_TIME) as? String{
            time.text = outputtime
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let outputloc = UserDefaults.standard.object(forKey:KEY_LOCATION) as? String{
            loc.text = outputloc
        }
        
        if let outputtime = UserDefaults.standard.object(forKey:KEY_LOCATION) as? String{
            time.text = outputtime
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        if let outputloc = UserDefaults.standard.object(forKey:"Locatin1") as? String{
//            loc.text = outputloc
//        }
//    }


}
