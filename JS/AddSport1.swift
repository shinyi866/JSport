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
    
    var data:[String] = ["1","2","3","4","5","6","7","8","9"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GLCell", for: indexPath) as UICollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellToDeselect:UICollectionViewCell = LGCell.cellForItem(at: indexPath)!
        cellToDeselect.contentView.backgroundColor = UIColor.blue
        print("select item \(indexPath.row)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
