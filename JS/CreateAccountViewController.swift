//
//  CreateAccountViewController.swift
//  JS
//
//  Created by 郭 芷瑄 on 2018/2/4.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateAccountViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func createAccount(_ sender: Any) {
        
        if emailTextField.text == "" {
            let alertController = UIAlertController(title : "Error", message : "Please enter your email and password", preferredStyle : .alert)
            let defaultAction = UIAlertAction(title : "OK",  style : .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){ (user, error) in
                if error == nil {
                    let alertController = UIAlertController(title : "Success", message : "You have successfully signed up", preferredStyle : .alert)
                    let defaultAction = UIAlertAction(title : "OK",  style : .cancel, handler: { (UIAlertAction) in self.dismiss(animated: true, completion: nil)
                    })
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }else{
                    let alertController = UIAlertController(title : "Error", message : error?.localizedDescription, preferredStyle : .alert)
                    let defaultAction = UIAlertAction(title : "OK",  style : .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    //hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //press return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return (true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //account
        emailTextField.textAlignment = .center
        emailTextField.placeholder = "手機/電子信箱"
        
        //password
        passwordTextField.textAlignment = .center
        passwordTextField.placeholder = "密碼"
        
        //hide keyboard
        self.passwordTextField.delegate = self
        self.emailTextField.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
