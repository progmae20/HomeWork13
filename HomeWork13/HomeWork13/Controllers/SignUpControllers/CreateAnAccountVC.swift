//
//  CreateAnAccountVC.swift
//  HomeWork13
//
//  Created by Anastasiya on 19.08.21.
//

import UIKit

class CreateAnAccountVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    
    
    
    @IBOutlet weak var emaiErrorLbl: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var passErrorLbl: UILabel!
    
    @IBOutlet var verifPassView: [UIView]!
    
    @IBOutlet weak var confPassTF: UITextField!
    @IBOutlet weak var confPassErrorLbl: UILabel!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var scrolView: UIScrollView!
    
    private var isValidEmail = false
    private var isConfPass = false
    private var passwordStrength: PasswordStrength = .veryWeak
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       self.startKeyboardObserver()
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = emailTF.text,
              let name = nameTF.text,
              let pass = passTF.text,
              let destVC = segue.destination as? CodeVerifVC else { return }
       
        destVC.email = email
        destVC.name = name
        destVC.pass = pass
    }


    @IBAction func signInButtonTouch() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func emailTFChanged(_ sender: UITextField) {
        guard let email = sender.text else { return }
        isValidEmail = VerificationService.isValidEmail(email: email)
        emaiErrorLbl.isHidden = isValidEmail
        
        updateBtnState ()
    }
    
    @IBAction func passwordTFChenged(_ sender: UITextField) {
        guard let pass = sender.text else { return }
        passwordStrength = VerificationService.isValidPassword(pass: pass)
        passErrorLbl.isHidden = !(passwordStrength == .veryWeak)
        verifPassView.enumerated().forEach { (index, view) in
            view.alpha = 0.3
            if (index <= passwordStrength.rawValue -  1) {
                view.alpha = 1
            }
        }
        
        guard let pass2 = confPassTF.text else { return }
        updatePassErrorLbl(pass1: pass, pass2: pass2)
        
        updateBtnState ()
    }
    
    @IBAction func confPassTFChanged(_ sender: UITextField) {
        guard let pass1 = passTF.text,
              let pass2 = sender.text else { return }
        updatePassErrorLbl(pass1: pass1, pass2: pass2)
        
        updateBtnState ()
    }
    
    @IBAction func signUpTouch(_ sender: UIButton) {
        performSegue(withIdentifier: "showCodeVerVC", sender: nil)
    }
    
    private func updatePassErrorLbl (pass1: String, pass2: String) {
        isConfPass = VerificationService.isPassConfirm (pass1: pass1, pass2: pass2)
        confPassErrorLbl.isHidden = isConfPass
    }
    
    private func updateBtnState () {
        signUpBtn.isEnabled = isValidEmail &&
            isConfPass && (passwordStrength != .veryWeak)
    }
    
    private func startKeyboardObserver(){
        NotificationCenter.default.addObserver(self, selector:
                                                #selector (CreateAnAccountVC.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
                                                #selector (CreateAnAccountVC.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrolView.contentInset = contentInsets
        scrolView.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrolView.contentInset = contentInsets
        scrolView.scrollIndicatorInsets = contentInsets
    }
}
