//
//  AddSport.swift
//  JS
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class AddSport: UIViewController {
    
    var myUserDefaults : UserDefaults!
    
    
    
    @IBOutlet var locationField: UITextField!
    @IBOutlet var timeField: UITextField!
    @IBOutlet var kindField: UITextField!
    @IBOutlet var NumberField: UITextField!
    
    @IBOutlet var loc: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var kind: UILabel!
    @IBOutlet var num: UILabel!
    
    @IBAction func btnSend(_ sender: Any) {
        UserDefaults.standard.set(locationField.text, forKey: "Locatin")
        locationField.text = ""
        
        if let outputloc = UserDefaults.standard.object(forKey:"Locatin") as? String{
            loc.text = outputloc
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let outputloc = UserDefaults.standard.object(forKey:"Locatin") as? String{
            loc.text = outputloc
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
