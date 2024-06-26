//
//  SignInViewModel.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var dataManager = DataManager.shared
    
    @Published var isErrorModePresented = false
    @Published var isVerificationCodeViewPresented = false
    
    @Published var verificationNumber: [String] = ["", "", "", ""]
            
    func validateEmail(text: String) -> Bool {
        if text.count > 100 {
            return false
        }
        
        let emailRegex = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: text)
    }
    
    func continueButonTapped(with text: String) {
        isVerificationCodeViewPresented = validateEmail(text: text)
    }
    
    func setUpFocusableField(index: Int) -> FocusableField {
        switch index {
        case 0:
                .firstDigit
        case 1:
                .secondDigit
        case 2:
                .thirdDigit
        default:
                .fourthDigit
        }
    }
    
    
    func focusFirstField() -> FocusableField {
        FocusableField.allCases.first ?? .firstDigit
    }
    
    func focusNextField(focusedField: FocusableField?) -> FocusableField? {
        switch focusedField {
        case .firstDigit:
            return .secondDigit
        case .secondDigit:
            return .thirdDigit
        case .thirdDigit:
            return .fourthDigit
        case .fourthDigit:
            return nil
        case .none:
            return nil
        }
    }
}

enum FocusableField: CaseIterable, Hashable {
    case firstDigit
    case secondDigit
    case thirdDigit
    case fourthDigit
}
