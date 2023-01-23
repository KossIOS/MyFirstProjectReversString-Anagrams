//
//  Reverser.swift
//  MyFirstProjectReversString
//
//  Created by Konstantyn Koroban on 03/10/2022.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
