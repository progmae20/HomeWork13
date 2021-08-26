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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func chengeBtn(_ sender: Any) {
        UserDefaults.standard.set(nameTF.text, forKey: Constants.name)
        UserDefaults.standard.set(ageTF.text, forKey: Constants.age)
        UserDefaults.standard.set(sexTF.text, forKey: Constants.sex)
        UserDefaults.standard.set(studyWorkTF.text, forKey: Constants.studyWork)
        UserDefaults.standard.set(aboutMeTView.text, forKey: Constants.aboutMe)
    }
}
