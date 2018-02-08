//
//  SportData.swift
//  JS
//
//  Created by apple on 2018/2/3.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import Foundation
import UIKit

class SportData {
    
    var location: String
    var time: String
    var status: String
    var dis: String
    var pic: UIImage
    var txt: String
    var join: Bool
    
    
    init(location: String , time: String , dis:String, pic: UIImage,status:String,txt:String,join:Bool){
        self.location = location
        self.time = time
        self.dis = dis
        self.pic = pic
        self.status = status
        self.txt = txt
        self.join = join
    }
    
}

var SPORT_DATA: [SportData] = []

class Location{
    
    let NTNU_lat:Double = 25.0260598
    let NTNU_lng:Double = 121.527532
    
    let NTU_lat:Double = 25.0173405
    let NTU_lng:Double = 121.5397518
    
    let NTUT_lat:Double = 25.0422329
    let NTUT_lng:Double = 121.5354974
    
    let NTUST_lat:Double = 25.0136906
    let NTUST_lng:Double = 121.5406792
    
    let NTUA_lat:Double = 25.0058851
    let NTUA_lng:Double = 121.4475848
    
    let UT_lat:Double = 25.0355353
    let UT_lng:Double = 121.5135416
    
}

let loc = Location()

func CountDistance(lat: Double , lng: Double) -> Double {
    let dis_squ:Double = (loc.UT_lat - lat) * (loc.UT_lat - lat) + (loc.UT_lng - lng) * (loc.UT_lng - lng)
    return sqrt(dis_squ) * 100
}


//let x = SportData(location: "xxx", time: "yyy")
//class SportDatatest {
//
//    var location: String
//    var time: String
//    var join:Bool = false
//
//
//    init(location: String , time: String, join:Bool){
//        self.location = location
//        self.time = time
//        self.join = join
//    }
//
//}

//class Check: SportDatatest {
//
//    override var join:Bool {
//        get{
//            return super.join
//        }
//
//        set{
//            super.join = false
//        }
//    }
//}
//
//var SPORT_DATAtest: [SportDatatest] = []






