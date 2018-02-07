//
//  MySportViewController.swift
//  JS
//
//  Created by 郭 芷瑄 on 2018/2/7.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit

class MySportViewController: UIViewController {

    @IBAction func daanChat(_ sender: Any) {
        performSegue(withIdentifier: "daan", sender: self)
    }
    @IBAction func utChat(_ sender: Any) {
        performSegue(withIdentifier: "ut", sender: self)
    }
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
