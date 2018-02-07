//
//  Information.swift
//  JS
//
//  Created by apple on 2018/2/7.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit
import Foundation

class Information: UIViewController {
    
    var location1:String?
    
    @IBOutlet var imageview: UIImageView!
    @IBOutlet var time: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var txt: UILabel!
    
    @IBAction func join(_ sender: Any) {
        print(location1)
    }
//    override func viewDidAppear(_ animated: Bool) {
//        location.text = location1
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        location.text = location1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
