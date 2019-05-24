//
//  ViewController.swift
//  qa-application
//
//  Created by Apple on 5/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {    
    
    @IBOutlet weak var containerView: UIView!
    
    let button:UIButton = {
        let button = UIButton()
        button.setTitle("Iniciar sesion", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red:0.49, green:0.75, blue:0.29, alpha:1.0)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red:0.49, green:0.75, blue:0.29, alpha:1.0).cgColor
        
        return button
    }()
    
    let registerButton:UIButton = {
        let button = UIButton()
        button.setTitle("Crear PQRS", for: .normal)
        button.setTitleColor(UIColor(red:0.49, green:0.75, blue:0.29, alpha:1.0), for: .normal)
        return button
    }()
    
    let nui:UITextField = {
        let text = UITextField()
        text.placeholder = "Nui"
        text.textColor = .gray
        text.setLeftPaddingPoints(10)
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.gray.cgColor
    
        return text
    }()
    
    let password:UITextField = {
        let text = UITextField()
        text.placeholder = "Password"
        text.textColor = .gray
        text.setLeftPaddingPoints(10)
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.gray.cgColor
        
        return text
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        startAnimation()
    }
    
    
    func startAnimation() {
        
        let animationView = AnimationView(name: "loaderBackground")
        registerButton.frame = CGRect(x: 0, y: self.view.frame.height / 1.27, width: self.view.frame.width, height: 50)
        button.frame = CGRect(x: 16, y: self.view.frame.height / 1.35, width: self.view.frame.width - 30, height: 50)
        
        nui.frame = CGRect(x: 16, y: self.view.frame.height / 1.7, width: self.view.frame.width - 30, height: 50)
        
        password.frame = CGRect(x: 16, y: self.view.frame.height / 1.5, width: self.view.frame.width - 30, height: 50)
        
        animationView.frame = self.containerView.frame
        self.containerView.addSubview(animationView)
        
        animationView.addSubview(registerButton)
        animationView.addSubview(button)
        animationView.addSubview(nui)
        animationView.addSubview(password)
        
        
        
        registerButton.addTarget(self, action: #selector(goToRegister), for: .touchDown)
        
        
        animationView.loopMode = .loop
        animationView.play()
    }
    
    
    @objc func goToRegister() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

