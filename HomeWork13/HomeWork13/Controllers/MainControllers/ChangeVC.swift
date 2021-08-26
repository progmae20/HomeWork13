//
//  ChangeVC.swift
//  HomeWork13
//
//  Created by Anastasiya on 26.08.21.
//

import UIKit

class ChangeVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var sexTF: UITextField!
    @IBOutlet weak var studyWorkTF: UITextField!
    @IBOutlet weak var aboutMeTView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func chengeBtn(_ sender: Any) {
        if nameTF.text != "" {
            UserDefaults.standard.set(nameTF.text, forKey: Constants.name)
        }
        if ageTF.text != "" {
            UserDefaults.standard.set(ageTF.text, forKey: Constants.age)
        }
        if sexTF.text != "" {
            UserDefaults.standard.set(sexTF.text, forKey: Constants.sex)
        }
        if studyWorkTF.text != "" {
            UserDefaults.standard.set(studyWorkTF.text, forKey: Constants.studyWork)
        }
        if aboutMeTView.text != "" {
            UserDefaults.standard.set(aboutMeTView.text, forKey: Constants.aboutMe)
        }
    
        navigationController?.popViewController(animated: true)
        
    }
}
