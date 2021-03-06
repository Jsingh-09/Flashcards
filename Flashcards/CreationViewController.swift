//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Jashan Bhinder on 3/6/20.
//  Copyright © 2020 Jashan Bhinder. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!

    @IBOutlet weak var QuestionTextField: UITextField!
    @IBOutlet weak var OptionOneTextField: UITextField!
    @IBOutlet weak var OptionTwoTextField: UITextField!
    @IBOutlet weak var OptionThreeTextField: UITextField!
    @IBOutlet weak var AnswerTextField: UITextField!
    var initialQuestion: String?
    var initialAnswer: String?
    var initialOptionOne: String?
    var initialOptionTwo: String?
    var initialOptionThree: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        QuestionTextField.text = initialQuestion
        AnswerTextField.text = initialAnswer
        OptionOneTextField.text = initialOptionOne
        OptionTwoTextField.text = initialOptionTwo
        OptionThreeTextField.text = initialOptionThree
        
    }
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = QuestionTextField.text
        let AnswerText = AnswerTextField.text
        let OptionOneText = OptionOneTextField.text
        let OptionTwoText = OptionTwoTextField.text
        let OptionThreeText = OptionThreeTextField.text
        
        // Check if empty
        var isExisting = false
        if initialQuestion != nil{
            isExisting = true
        }
        if questionText == nil || AnswerText == nil || questionText!.isEmpty || AnswerText!.isEmpty || OptionOneText == nil || OptionTwoText == nil || OptionThreeText == nil || OptionOneText!.isEmpty || OptionTwoText!.isEmpty || OptionThreeText!.isEmpty {
            // Show Error
            let alert = UIAlertController(title: "Missing Text", message: "You need to enter both a question, an answer, and options", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            
        } else {
            flashcardsController.updateFlashcards (Question: questionText!, Answer: AnswerText!, OptionOne: OptionOneText!, OptionTwo: OptionTwoText!, OptionThree: OptionThreeText!, isExisting: isExisting)
            dismiss(animated: true)
        }
    }

}
