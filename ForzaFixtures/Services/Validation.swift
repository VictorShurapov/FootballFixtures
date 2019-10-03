//
//  Validation.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/29/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import Foundation

enum Alert {
    case success
    case failure
    case error
}

enum Valid {
    case success
    case failure(Alert, AlertMessages)
}

enum ValidationType {
    case email
    case phoneNo
    case alphabeticString
    case password
}

enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // Email
    case password = "^.{6,15}$" // Password length 6-15
    case alphabeticStringWithSpace = "^[a-zA-Z ]{3,64}$" // e.g. hello sandeep
    case phoneNo = "[0-9]{10,14}" // PhoneNo 10-14 Digits
}

enum AlertMessages: String {
    case invalidEmail = "InvalidEmail"
    case invalidPhone = "Invalid Phone"
    case invalidAlphabeticString = "Invalid String"
    case invalidPSW = "Invalid Password"
    
    case emptyPhone = "Empty Phone"
    case emptyEmail = "Empty Email"
    case emptyAlphabeticString = "Empty String"
    case emptyPSW = "Empty Password"
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
            case .email:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .email, .emptyEmail, .invalidEmail)) {
                    return tempValue
                }
            case .phoneNo:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .phoneNo, .emptyPhone, .invalidPhone)) {
                    return tempValue
                }
            case .alphabeticString:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .alphabeticStringWithSpace, .emptyAlphabeticString, .invalidAlphabeticString)) {
                    return tempValue
                }
            case .password:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .password, .emptyPSW, .invalidPSW)) {
                    return tempValue
                }
            }
        }
        return .success
    }
    
    // swiftlint:disable large_tuple
    func isValidString(_ input: (text: String, regex: RegEx, emptyAlert: AlertMessages, invalidAlert: AlertMessages)) -> Valid? {
        if input.text.isEmpty {
            return .failure(.error, input.emptyAlert)
        } else if isValidRegEx(input.text, input.regex) != true {
            return .failure(.error, input.invalidAlert)
        }
        return nil
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format: "SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}
