//
//  JournallingViewController.swift
//  OrbitalHappyTownNew
//
//  Created by Leandrea De Conceicao on 13/6/23.
//

import UIKit

class JournallingViewController: UIViewController {
    
    @IBOutlet weak var journalLabel: UILabel!
    @IBOutlet weak var journalTextView: UITextView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var generateNewPromptButton: UIButton!
    @IBOutlet weak var calendarScrollView: UIScrollView!
    
    
    
    // Add a variable to store journal entries
        var journalEntries: [String] = []
        
        let journalPrompts = [
            "Write about a moment of gratitude you experienced today.",
            "Describe a challenge you overcame and how it made you stronger.",
            "Reflect on a person who has positively impacted your life and why.",
            "Write about something that brings you joy and why it's meaningful to you.",
            "Discuss a goal you're currently working towards and the progress you've made.",
            // Add more prompts as needed
        ]
        
        func getRandomPrompt() -> String {
            let randomIndex = Int.random(in: 0..<journalPrompts.count)
            return journalPrompts[randomIndex]
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            journalTextView.delegate = self
            journalTextView.text = "Start typing about anything..."
            journalTextView.textColor = .darkGray
        }
        
        @IBAction func closeButtonTapped(_ sender: Any) {
            // Handle close button tap
        }
        
        @IBAction func submitButtonTapped(_ sender: Any) {
            // Handle submit button tap
            if let entryText = journalTextView.text {
                journalEntries.append(entryText)
                journalTextView.text = ""
                
                // Pass the updated journal entries to the HistoryViewController
                if let historyVC = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController {
                    historyVC.journalEntries = journalEntries
                }
            }
        }
        
        @IBAction func generateNewPromptButtonTapped(_ sender: Any) {
            let newPrompt = getRandomPrompt()
            journalTextView.text = newPrompt
        }
    }

    extension UILabel {
        func underline() {
            guard let text = self.text else { return }
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
            self.attributedText = attributedString
        }
    }

    extension UIButton {
        func underline() {
            guard let text = self.titleLabel?.text else { return }
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
            self.setAttributedTitle(attributedString, for: .normal)
        }
    }

    extension JournallingViewController: UITextViewDelegate {
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == "Start typing about anything..." {
                textView.text = ""
                textView.textColor = .black
            }
            // Move the cursor to the end of the text
            textView.selectedRange = NSMakeRange(textView.text.count, 0)
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = "Start typing about anything..."
                textView.textColor = .darkGray
            }
        }
    }






