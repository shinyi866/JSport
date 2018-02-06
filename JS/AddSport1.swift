//
//  AddSport1.swift
//  JS
//
//  Created by apple on 2018/2/4.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class AddSport1: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var LGCell: UICollectionView!
    
    var data:[[(String,Bool)]] = []
    var images = ["btn_3_off_01","btn_3_on_01","btn_3_off_02","btn_3_on_02","btn_3_off_01","btn_3_on_01","btn_3_off_02","btn_3_on_02","btn_3_off_01","btn_3_on_01","btn_3_off_02","btn_3_on_02","btn_3_off_01","btn_3_on_01","btn_3_off_02","btn_3_on_02","btn_3_off_01","btn_3_on_01","btn_3_off_02","btn_3_on_02","btn_3_off_01","btn_3_on_01","btn_3_off_02","btn_3_on_02","btn_3_off_01","btn_3_on_01","btn_3_off_02","btn_3_on_02"]
    
    //    var data1:[(String,Bool)] = ["有球","有場地","有器材","有食物","有飲水機","有便利商店","有私人場地","有其他隊友","有急救包"].map({str in return (str,false)})
    var datatest:[String] = []
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.data[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(20, 20, 20, 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:Sport1Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GLCell", for: indexPath) as! Sport1Cell
        cell.label.text = data[indexPath.section][indexPath.row].0
        cell.imageview.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellToDeselect:UICollectionViewCell = LGCell.cellForItem(at: indexPath)!
        
        if data[indexPath.section][indexPath.row].1 {
            cellToDeselect.contentView.backgroundColor = UIColor.blue  //改btn按鈕取消
            data[indexPath.section][indexPath.row].1 = false
        }else{
            //btnselect = true
            cellToDeselect.contentView.backgroundColor = UIColor.darkGray  //改btn按鈕選上
            data[indexPath.section][indexPath.row].1 = true
        }
        
        print("select item \(indexPath.row)")
        datatest.removeAll()  //先將array清空再一次將true放入array
        for i in 0..<data.count {
            for j in 0..<data[i].count{
                if data[i][j].1 == true{
                    datatest.append(data[i][j].0)
                }
            }
        }
        
        print(datatest)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        LGCell.reloadData()
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
        
        let sportstatus = segue.destination as! AddSport
        for i in 0..<datatest.count{
            sportstatus.receivestatus.append(datatest[i])
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data = [["籃球 ","排球 ","棒球 ","壘球 ","足球 ","慢跑 ","羽球 ","健身 ","桌球 ","撞球 ","網球 ","高爾夫球 ","其他球類 ","其他運動 ","不限 "].map({str in return (str,false)})]
        
        self.data += [["有球 ","有場地 ","有器材 ","有食物 ","有飲水機 ","有便利商店 ","有私人場地 ","有其他隊友 ","有急救包 "].map({str in return (str,false)})]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
