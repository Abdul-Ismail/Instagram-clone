//
//  SigninViewController.swift
//  InstgramClone
//
//  Created by Abdulaziz Ismail on 28/08/2017.
//  Copyright © 2017 Abdulaziz Ismail. All rights reserved.
//

import UIKit
import FirebaseAuth

class SigninViewController: UIViewController {

    @IBOutlet weak var emailTextFiel: UITextField!
    
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextFiel.backgroundColor = UIColor.clear
        emailTextFiel.tintColor = UIColor.white
        emailTextFiel.textColor = UIColor.white
        emailTextFiel.attributedPlaceholder = NSAttributedString(string: emailTextFiel.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor(white: 1.0, alpha: 0.6)])
        let bottomLayerEmail = CALayer() //cylayer provides us with a low level grpahic animation
        bottomLayerEmail.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        bottomLayerEmail.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        emailTextFiel.layer.addSublayer(bottomLayerEmail)
        
        passwordTextField.backgroundColor = UIColor.clear
        passwordTextField.tintColor = UIColor.white
        passwordTextField.textColor = UIColor.white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor(white: 1.0, alpha: 0.6)])
        let bottomLayerPassword = CALayer() //cylayer provides us with a low level grpahic animation
        bottomLayerPassword.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        bottomLayerPassword.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        passwordTextField.layer.addSublayer(bottomLayerPassword)
        signInButton.isEnabled = false
        signInButton.setTitleColor(UIColor.lightText, for: UIControlState.normal)
        
        handleTextFieldMethod()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
      //  if Auth.auth().currentUser != nil {
         //   self.performSegue(withIdentifier: "signInToTabbarVC", sender: nil)
       // }
    }
    
    func handleTextFieldMethod(){
        passwordTextField.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        emailTextFiel.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        
    }
    
    func textFieldDidChange(){
        guard let email = emailTextFiel.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            signInButton.setTitleColor(UIColor.lightText, for: UIControlState.normal)
            signInButton.isEnabled = false
            return
            
        }
        signInButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        signInButton.isEnabled = true
    }


    @IBAction func signInButton_TouchUpInside(_ sender: Any) {
        view.endEditing(true)
        ProgressHUD.show("waiting...", interaction: false)
        AuthService.signIn(email: emailTextFiel.text!, password: passwordTextField.text!, onSuccess: {
            self.performSegue(withIdentifier: "signInToTabbarVC", sender: nil)
            ProgressHUD.showSuccess("welcome")
        }, onError: { error in
            ProgressHUD.showError(error!)
            
        })
      }
    
    
    
}
