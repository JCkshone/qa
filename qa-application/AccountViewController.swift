//
//  AccountViewController.swift
//  qa-application
//
//  Created by Apple on 5/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class AccountViewController:UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var rootContentAccountInfoTV: UITableView!
    
    @IBOutlet weak var user: UIView!
    
    @IBOutlet weak var closeSessionBtn: UIButton!
    let userInfo = AccountModel()
    
    
    let animationView:AnimationView = {
        let animation = AnimationView(name: "personalCharacter")
        animation.loopMode = .loop
        animation.layer.cornerRadius = 100
        animation.layer.borderWidth = 1
        animation.layer.borderColor = UIColor.gray.cgColor
        return animation
    }()
    
    override func viewDidLoad() {
        userInfo.first_name = "Juan"
        userInfo.middle_name = "Camilo"
        userInfo.surname = "Navarro"
        userInfo.second_surname = "Alvira"
        userInfo.phone = "3203568924"
        userInfo.nuip = "1012439433"
        userInfo.person_status = 1
        userInfo.email = "jcinfonet.kshone@gmail.com"
        self.setupView()
    }
    
    func setupView() -> Void {
        animationView.frame = CGRect(x: self.view.frame.width / 5, y: 16, width: self.view.frame.width / 2, height: self.view.frame.width / 2)
        rootContentAccountInfoTV.separatorColor = .white
        rootContentAccountInfoTV.tableFooterView = UIView()
        
        closeSessionBtn.backgroundColor = UIColor(red:0.49, green:0.75, blue:0.29, alpha:1.0)
        closeSessionBtn.layer.cornerRadius = 10
        closeSessionBtn.layer.borderWidth = 1
        closeSessionBtn.layer.borderColor = UIColor(red:0.49, green:0.75, blue:0.29, alpha:1.0).cgColor
        closeSessionBtn.addTarget(self, action: #selector(closeSession), for: .touchDown)
        
        user.addSubview(animationView)
        animationView.play()
    }
    
    @objc func closeSession() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "initController") as! ViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = Bundle.main.loadNibNamed("NormalField", owner: self, options: nil)?.first as! NormailField
        var titleName:String
        var textEditVale:String
        var isDesable:Bool
        /*
        switch indexPath.row{
        case 0:
            titleName = "Nombres"
            textEditVale = "\(String(describing: userInfo.first_name!)) \(String(describing: userInfo.middle_name!))"
            isDesable = true
            break
        case 1:
            titleName = "Apellidos"
            textEditVale = "\(String(describing: userInfo.surname!)) \(String(describing: userInfo.second_surname!))"
            isDesable = true
            break
        case 2:
            titleName = "Correo electronico"
            textEditVale = "\(String(describing: userInfo.email!))"
            isDesable = true
            break
        case 3:
            titleName = "Nuip"
            textEditVale = "\(String(describing: userInfo.nuip!))"
            isDesable = false
            break
        case 4:
            titleName = "Numero telefonico"
            textEditVale = "\(String(describing: userInfo.phone!))"
            isDesable = false
            break
        case 5:
            titleName = "Nombres"
            textEditVale = "\(String(describing: userInfo.first_name)) \(String(describing: userInfo.second_surname))"
            isDesable = false
            break
        default:
            titleName = "Nombres"
            textEditVale = "\(String(describing: userInfo.first_name)) \(String(describing: userInfo.second_surname))"
            isDesable = false
        }
        
        itemCell.selectionStyle = .none
        itemCell.itemNameLabel.text = titleName
        itemCell.itemEditTex.text = textEditVale
        itemCell.itemEditTex.isUserInteractionEnabled  = isDesable
        */
        return itemCell
    }
}
