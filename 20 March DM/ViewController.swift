//
//  ViewController.swift
//  20 March DM
//
//  Created by Appinventiv on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var uName: UITextField!
    @IBOutlet weak var uID: UITextField!
    //var userDetails: DataModel?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        let parameters = [["Name":self.uName.text!],["ID":self.uID.text!],["City":"Haldwani"]]
//        APIController().postAPI(parameters: parameters) { (user) in
//            print("Hello ",user.name!," your Id is ",user.ID!," & city is ",user.city!)
        
            APIController().getAPI(parameters: parameters, onModelSuccess: { (user) in
                print("Hello ",user.name!," your Id is ",user.ID!," & city is ",user.city!)
            }, onFailure: { (error) in
                print("Found error",error)
            })
//
//
//        APIController().postAPI(parameters: parameters, onModelSuccess: { (user) in
//            print("Hello ",user.name!," your Id is ",user.ID!," & city is ",user.city!)
//        }) { (err) in
//            print(err)
//        }
        }
    }


