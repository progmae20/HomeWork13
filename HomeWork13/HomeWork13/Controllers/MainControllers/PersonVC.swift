//
//  PersonVC.swift
//  HomeWork13
//
//  Created by Anastasiya on 25.08.21.
//

import UIKit

class PersonVC: UIViewController {

    @IBOutlet weak var nameAndSurname: UILabel!
    @IBOutlet weak var emailPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameAndEmailLbl ()
        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        nameAndEmailLbl ()
    }

    private func nameAndEmailLbl () {
        if let nameAndSurname = UserDefaults.standard.object(forKey: Constants.name) as? String,
           nameAndSurname != "" {
            self.nameAndSurname.text = nameAndSurname
        } else {
            self.nameAndSurname.text = "--You have not entered your name--"
        }
        emailPerson.text = UserDefaults.standard.object(forKey: Constants.email) as! String
    }
    
}
