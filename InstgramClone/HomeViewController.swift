//
//  HomeViewController.swift
//  InstgramClone
//
//  Created by Abdulaziz Ismail on 30/08/2017.
//  Copyright © 2017 Abdulaziz Ismail. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad() //called only once during lifetime of this view controller

        
    }

    @IBAction func logout_TouchUpInside(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        } catch let logoutError{
            print(logoutError)
        }
        
        
        let storyBoard = UIStoryboard(name: "Start", bundle: nil)
        let signInVC = storyBoard.instantiateViewController(withIdentifier: "SigninViewController")
        self.present(signInVC, animated: true, completion: nil)
        

    }
    
    
}


