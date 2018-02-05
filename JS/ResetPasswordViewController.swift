//
//  ResetPasswordViewController.swift
//  JS
//
//  Created by 郭 芷瑄 on 2018/2/4.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func resetAction(_ sender: Any) {
        if self.emailTextField.text == "" {
            let alertController = UIAlertController(title : "Oops!~", message : "Please enter your email.", preferredStyle : .alert)
            let defaultAction = UIAlertAction(title : "OK",  style : .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }else{
            Auth.auth().sendPasswordReset(withEmail: self.emailTextField.text!, completion: {(error) in
                var title = ""
                var message = ""
                if error != nil{
                    title = "Error!"
                    message = (error?.localizedDescription)!
                }else{
                    title = "Success!"
                    message = "Password reset email sent."
                    self.emailTextField.text = ""
                }
                let alertController = UIAlertController(title : title, message : message, preferredStyle : .alert)
                let defaultAction = UIAlertAction(title : "OK",  style : .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            })
        }
    }
    
    //hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //press return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return (true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //placeholder
        emailTextField.textAlignment = .center
        emailTextField.placeholder = "電子信箱"
        
        //hide keyboard
        self.emailTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


