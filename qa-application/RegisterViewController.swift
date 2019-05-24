//
//  RegisterViewController.swift
//  qa-application
//
//  Created by Apple on 5/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var namesLabel: UITextField!
    @IBOutlet weak var lastNamesLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    @IBOutlet weak var pqrsTextView: UITextView!
    @IBOutlet weak var registerPQRSButton: UIButton!
    @IBOutlet weak var singingButton: UIButton!
    @IBOutlet weak var rootTitleSection: UIView!
    @IBOutlet weak var nuipLabel: UITextField!
    
    
    let userInfo = AccountModel()
    let pqrsInfo = Pqrs()
    let registerInfo = RegisterRequestModel()
    let api = APIFetch()
    
    let titleSection:UILabel = {
        let label = UILabel()
        label.text = "Ueb - QA"
        label.font = label.font.withSize(30)
        label.textColor = UIColor(red:0.49, green:0.75, blue:0.29, alpha:1.0)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func setupView() -> Void {
        
        
        rootTitleSection.addSubview(titleSection)
        
        titleSection.frame = CGRect(x: self.view.frame.width / 3, y: 16 , width: 200, height: 50)
       
        
        registerPQRSButton.backgroundColor = UIColor(red:0.49, green:0.75, blue:0.29, alpha:1.0)
        registerPQRSButton.setTitleColor(.white, for: .normal)
        registerPQRSButton.layer.cornerRadius = 10
        registerPQRSButton.layer.borderWidth = 1
        registerPQRSButton.clipsToBounds = true
        registerPQRSButton.layer.borderColor = UIColor(red:0.49, green:0.75, blue:0.29, alpha:1.0).cgColor
        
        singingButton.setTitleColor( UIColor(red:0.49, green:0.75, blue:0.29, alpha:1.0), for: .normal)
        
        
        pqrsTextView.layer.cornerRadius = 10
        pqrsTextView.layer.borderWidth = 1
        pqrsTextView.clipsToBounds = true
        pqrsTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        singingButton.addTarget(self, action: #selector(goToLogin), for: .touchDown)
        registerPQRSButton.addTarget(self, action: #selector(goToHome), for: .touchDown)
        
       
        
        
    }
    
    @objc func goToLogin() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "initController") as! ViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @objc func goToHome() -> Void {
        let names = namesLabel.text!.components(separatedBy: " ")
        let lastNames = lastNamesLabel.text!.components(separatedBy: " ")
        userInfo.first_name = names[0]
        userInfo.middle_name = names[1]
        userInfo.surname = lastNames[0]
        userInfo.second_surname = lastNames[1]
        userInfo.email = emailLabel.text!
        userInfo.phone = phoneNumberLabel.text!
        userInfo.nuip = nuipLabel.text!
        
        pqrsInfo.comments = pqrsTextView.text!
        pqrsInfo.pqrs_type = 1
        
        registerInfo.user = userInfo
        registerInfo.pqrs = pqrsInfo
        
        api.userRegister(registerInfo: registerInfo, success: { (response) in
            print(response.message)
            
            self.goToLogin()
        }) { (Error) in
            print(Error.localizedDescription)
        }
    }
}
