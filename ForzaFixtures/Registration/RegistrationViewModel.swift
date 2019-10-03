//
//  RegistrationViewModel.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/29/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import Foundation

class RegistrationViewModel {
    
    // MARK: - Properties
    var username = ""
    var phone = ""
    var email = ""
    var password = ""
    var corfirmPassword = ""
    var city = ""
    

    // MARK: - Methods
    func validationCheck(completion: @escaping () -> Void, errorDescription: @escaping (_ description: String) -> Void) {
        let response = Validation.shared.validate(values: (ValidationType.alphabeticString, username), (ValidationType.email, email))

        switch response {
        case .success:
            completion()
        case .failure(_, let errorMessage):
            errorDescription(errorMessage.localized())
        }
    }
    
}

