//
//  ViewController.swift
//  MyFirstProjectReversString
//
//  Created by Konstantyn Koroban on 27/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum Condition {
        case defaultReverse
        case customReverse
    }
    
    @IBOutlet weak var enterText: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var ignoreTextFld: UITextField!
    @IBOutlet weak var segmentControlCondition: UISegmentedControl!
    @IBOutlet weak var informationLabel: UILabel!
    
    private let model = ReversePhrase()
    private var reverseState: Condition = .defaultReverse {
        didSet {
            if reverseState == .defaultReverse {
                ignoreTextFld.isHidden = true
                informationLabel.isHidden = false
                textView.isHidden = true
            } else {
                informationLabel.isHidden = true
                ignoreTextFld.isHidden = false
                textView.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        enterText.delegate = self
        ignoreTextFld.isHidden = true
        changedAccesabillityLabel()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
   
    @IBAction func switchConditions(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            reverseState = .defaultReverse
        } else {
            reverseState = .customReverse
        }
    }
    
    @IBAction func reverseAction(_ sender: UIButton) {
        switch reverseState {
        case .defaultReverse:
            textView.text = model.reverse(phrase: enterText.text!)
            textView.isHidden = false
        case .customReverse:
            textView.text = model.reverse(
                phrase: enterText.text!,
                ignoredCharacters: ignoreTextFld.text!
            )
            
            textView.isHidden = false
        }
    }
    
    func changedAccesabillityLabel() {
        enterText.accessibilityLabel = "reverseTextField"
        textView.accessibilityLabel  = "resultTextView"
        tapButton.accessibilityLabel = "resultButton"
        ignoreTextFld.accessibilityLabel = "ignoreCharactersTextField"
        informationLabel.accessibilityLabel = "allCharactersLabel"
        
    }
    
    
}
