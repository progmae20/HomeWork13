//
//  CodeVerifVC.swift
//  HomeWork13
//
//  Created by Anastasiya on 23.08.21.
//

import UIKit

class CodeVerifVC: UIViewController {
    
    var email: String?
    var name: String?
    var pass: String?
    
    var generatorPassCode: String {
        let pass = Int.random(in: 10000...99999)
        return String(pass)
    }
    
    var passCode: String?
    
    @IBOutlet weak var codeSekretLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passCode = generatorPassCode
        setupUI()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = email,
              let name = name,
              let pass = pass,
              let destVC = segue.destination as? WelcomeVC else { return }
       
        destVC.email = email
        destVC.name = name
        destVC.pass = pass
    }
    
    @IBAction func codeTFChenged(_ sender: UITextField) {
        guard  let code = passCode,
               let ourCode = sender.text else { return }
        if isCodeValid(code: code, ourCode: ourCode) {
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
    }
    
    private func setupUI() {
        codeSekretLbl.text = (passCode ?? "") + " from \(email ?? "")"
    }
    
    private func isCodeValid(code: String, ourCode: String) -> Bool{
        return code == ourCode
    }
}

