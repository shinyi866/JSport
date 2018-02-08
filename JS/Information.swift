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
    
    var infolocation:String?
    var infotime:String?
    var infostatus: String?
    var infodis: String?
    var infopic: UIImage?
    var infotxt: String?
    var infojoin: Bool?
    
    @IBOutlet var imageview: UIImageView!
    @IBOutlet var time: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var txt: UILabel!
    
    @IBAction func join(_ sender: Any) {
        infojoin = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        location.text = infolocation
        time.text = infotime
        status.text = infostatus
        txt.text = infotxt
        imageview.image = infopic
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
