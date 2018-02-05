//
//  LoginViewController.swift
//  JS
//
//  Created by 郭 芷瑄 on 2018/2/4.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var facebookLogin: FBSDKLoginButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func loginAction(_ sender: Any) {
        if self.emailTextField.text == "" || self.passwordTextField.text == ""{
            let alertController = UIAlertController(title : "Error", message : "Please enter your email and password", preferredStyle : .alert)
            let defaultAction = UIAlertAction(title : "OK",  style : .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!)
            {(user, error) in
                if error == nil{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "YoVC")
                    self.present(vc!, animated: true, completion: nil)
                }else{
                    let alertController = UIAlertController(title : "Error", message : error?.localizedDescription, preferredStyle : .alert)
                    let defaultAction = UIAlertAction(title : "OK",  style : .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

    func loginButtonDidLogOut(_ loginButton : FBSDKLoginButton!){
        print("Did log out of FB")
    }
    
    func loginButton(_ loginButton : FBSDKLoginButton!, didCompleteWith result : FBSDKLoginManagerLoginResult!, error : Error!){
        if error != nil{
            print(error)
            return
        }
        /////////?????why it doesn't work?
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "YoVC")
        self.present(vc!, animated: true, completion: nil)
        print("Successfully loged in")
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
        emailTextField.placeholder = "電子信箱"
//        emailTextField.background=[UIImage imageNamed:@#imageLiteral(resourceName: "textbar.png")"textbar.png"]
        
        //password
        passwordTextField.textAlignment = .center
        passwordTextField.placeholder = "密碼"
//        passwordTextField.background=[UIImage imageNamed:
//            @#imageLiteral(resourceName: "textbar.png")"textbar.png"]
        
        //hide keyboard
        self.passwordTextField.delegate = self
        self.emailTextField.delegate = self
        
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.delegate = self
    }
        
//        loginButton.frame = CGRect(x : , y : , height : ,width : )
    
//        facebookLogin.readPermissions = ["public_profile", "email", "user_friends"]
//        facebookLogin.delegate = self as! FBSDKLoginButtonDelegate
//        
//        //第一次登入後可取得使用者token，後續即可直接登入
//        if (FBSDKAccessToken.current()) != nil{
//            //            fetchProfile()
//        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
