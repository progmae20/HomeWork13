//
//  SignInVC.swift
//  HomeWork13
//
//  Created by Anastasiya on 17.08.21.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var userErrorLbl: UILabel!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
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
    @IBAction func emailTFChanged(_ sender: UITextField) {
        updateStateBtn()
    }
    
    @IBAction func passTFChanged(_ sender: UITextField) {
        updateStateBtn()
    }
    
    @IBAction func signInTapped() {
        if let email = emailTF.text,
           let pass = passTF.text,
           checkUser(email: email, pass: pass) {
            performSegue(withIdentifier: "goToMainVC", sender: nil)
        }
    }
    private func checkUser (email: String ,pass: String) -> Bool {
        let emailSaved = UserDefaults.standard.object(forKey: Constants.email) as! String
        let passSaved = UserDefaults.standard.object(forKey: Constants.pass) as! String
        let userFound = (email == emailSaved) && (pass == passSaved)
        userErrorLbl.isHidden = userFound
        
        return userFound
    }
    
    private func updateStateBtn() {
        if let email = emailTF.text,
           let pass = passTF.text,
           email != "",
           pass != ""
        {
            signUpBtn.isEnabled = true
            
        } else {
            signUpBtn.isEnabled = false
        }
    }
//    private func updateBtnState () {
//        if let update = emailTF.text {
//            print(update)
//        } else if
//        signUpBtn.isEnabled =
//
}
