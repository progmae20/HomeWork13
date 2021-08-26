//
//  PersonDataVC.swift
//  HomeWork13
//
//  Created by Anastasiya on 25.08.21.
//

import UIKit

class PersonDataVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var namePerson: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailPerson: UILabel!
    
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var agePerson: UILabel!
    
    @IBOutlet weak var sexLbl: UILabel!
    @IBOutlet weak var sexPerson: UILabel!
    
    @IBOutlet weak var studyWorkLbl: UILabel!
    @IBOutlet weak var studyWorkPerson: UILabel!
    
    @IBOutlet weak var aboutMeLbl: UILabel!
    @IBOutlet weak var aboutMePerson: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        hideMissing ()
        nameAndEmailLbl ()
        
    }
    

    private func nameAndEmailLbl () {
        emailPerson.text = UserDefaults.standard.object(forKey: Constants.email) as! String
        namePerson.text = UserDefaults.standard.object(forKey: Constants.name) as? String
        agePerson.text = UserDefaults.standard.object(forKey: Constants.age) as? String
        sexPerson.text = UserDefaults.standard.object(forKey: Constants.sex) as? String
        studyWorkPerson.text = UserDefaults.standard.object(forKey: Constants.studyWork) as? String
        aboutMePerson.text = UserDefaults.standard.object(forKey: Constants.aboutMe) as? String
        
        if namePerson.text != "" && namePerson.text != nil {
            nameLbl.isHidden = false
            namePerson.isHidden = false
        }
        if agePerson.text != "" && agePerson.text != nil {
            ageLbl.isHidden = false
            agePerson.isHidden = false
        }
        if sexPerson.text != "" && sexPerson.text != nil {
            sexLbl.isHidden = false
            sexPerson.isHidden = false
        }
        if studyWorkPerson.text != "" && studyWorkPerson.text != nil {
            studyWorkLbl.isHidden = false
            studyWorkPerson.isHidden = false
        }
        if aboutMePerson.text != "" &&
                    aboutMePerson.text != nil &&
                    aboutMePerson.text != " " &&
                    aboutMePerson.text != "I like..."{
            aboutMeLbl.isHidden = false
            aboutMePerson.isHidden = false
        }
    }
    
    private func hideMissing () {
        nameLbl.isHidden = true
        namePerson.isHidden = true

        ageLbl.isHidden = true
        agePerson.isHidden = true

        sexLbl.isHidden = true
        sexPerson.isHidden = true

        studyWorkLbl.isHidden = true
        studyWorkPerson.isHidden = true

        aboutMeLbl.isHidden = true
        aboutMePerson.isHidden = true
    }
}
