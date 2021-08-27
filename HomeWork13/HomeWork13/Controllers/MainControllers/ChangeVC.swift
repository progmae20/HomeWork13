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
    
    @IBOutlet weak var scrolView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       self.startKeyboardObserver()
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
