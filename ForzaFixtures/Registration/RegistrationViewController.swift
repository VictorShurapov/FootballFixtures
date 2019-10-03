//
//  RegistrationViewController.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/29/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK: - IBOutlets and IBActions
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var userCityTextField: UITextField!
    
    @IBAction func check(_ sender: Any) {
        setLoginButton(activeState: !nextButton.isEnabled)
    }
    
    @IBAction func usernameChanged(_ sender: UITextField) {
        guard let username = sender.text else { return }
        viewModel.username = username
        validationCheck()
    }
    
    @IBAction func phoneChanged(_ sender: UITextField) {
        guard let phone = sender.text else { return }
        viewModel.phone = phone
        //validationCheck()
    }
    
    @IBAction func emailChanged(_ sender: UITextField) {
        guard let email = sender.text else { return }
        viewModel.email = email
        validationCheck()
    }
    
    @IBAction func passwordChanged(_ sender: UITextField) {
    }
    
    @IBAction func confirmPasswordChanged(_ sender: UITextField) {
    }
    
    @IBAction func setCityButtonClicked(_ sender: UIButton) {
    }
    
    
    
    
    
    
    @IBAction func nextButtonClicked(_ sender: Any) {
    }
    
    
    
    // MARK: - ViewModel
    let viewModel = RegistrationViewModel()
    
    // MARK: - ViewController's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    fileprivate func setLoginButton(activeState: Bool) {
        if activeState {
            nextButton.isEnabled = true
            nextButton.backgroundColor = .white
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        }
    }
    
    private func validationCheck() {
        viewModel.validationCheck(completion: { self.setLoginButton(activeState: true) }, errorDescription: { (errorDescription) in
            self.setLoginButton(activeState: false)
            // self.showAlert(errorMessage: errorDescription)
        })
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //
    //        // Is it phoneTextField check
    //        guard textField.tag == 1 else { return true }
    //
    //        // If textField has only 4 characters (our phone code)
    //        // and the user deletes one or more characters (the replacement string is empty)
    //        // we prevent textField from editing
    //        if textField.text?.count == 4 && string == "" {
    //            textField.text = "+380"
    //            return false
    //        }
    //
    //        return true
    
    //        if let checkedText = textField.text {
    //            let totalString = (checkedText + string)
    //            if totalString.count <= 10 {
    //                return true
    //            }
    //
    //            let index = totalString.index(totalString.startIndex, offsetBy: 10)
    //            textField.text = String(totalString[..<index])
    //
    //            return false
    //        }
    //        return false
    //    }
    //}
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let swiftRange = Range(range, in: textField.text ?? "") else { return false }
        
        guard let updatedString = textField.text?.replacingCharacters(in: swiftRange, with: string) else { return false }
        
        return validationFor(phoneNumber: updatedString)
        
    }
    
    func validationFor(phoneNumber: String) -> Bool {
        
        return (phoneNumber.hasPrefix("+380") && phoneNumber.count <= 13) ? true : false
    }
}

//extension MyViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField,
//                   shouldChangeCharactersIn range: NSRange,
//                   replacementString string: String) -> Bool {
//        if let text = textField.text,
//            let textRange = Range(range, in: text) {
//            let updatedText = text.replacingCharacters(in: textRange,
//                                                       with: string)
//            myvalidator(text: updatedText)
//        }
//        return true
//    }
//}

//extension RegistrationViewController: UITextFieldDelegate {
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        switch textField {
//        case nameTextField:
//            emailTextField.becomeFirstResponder()
//        case emailTextField:
//            viewModel.setNameEmail(email: emailTextField.text, name: nameTextField.text)
//        default:
//            break
//        }
//        return true
//    }
//}
//
//private func validationUserData(name: String, email: String) -> APIError? {
//    if let error =  ValidationService.validateName(name: name) {
//        return error
//    }
//    //===
//    if let error =  ValidationService.validateEmail(email: email) {
//        return error
//    }
//    
//    return .none
//}
