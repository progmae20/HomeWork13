//
//  WelcomeVC.swift
//  HomeWork13
//
//  Created by Anastasiya on 24.08.21.
//

import UIKit

class WelcomeVC: UIViewController {
    
    var email: String?
    var name: String?
    var pass: String?

    @IBAction func continueBtnTapped() {
        guard let email = email,
              let name = name,
              let pass = pass else { return }
        UserDefaults.standard.set(name, forKey: Constants.name)
        UserDefaults.standard.set(email, forKey: Constants.email)
        UserDefaults.standard.set(pass, forKey: Constants.pass)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
