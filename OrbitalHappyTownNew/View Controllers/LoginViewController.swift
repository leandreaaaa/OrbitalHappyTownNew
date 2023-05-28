//
//  LoginViewController.swift
//  OrbitalHappyTownNew
//
//  Created by Leandrea De Conceicao on 29/5/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        // Hide the error label
        errorLabel.alpha = 0
    }

    
    @IBAction func loginTapped(_ sender: Any) {
        // Validate the fields
        let error = validateFields()

        if let error = error {
            showError(error)
        } else {
            // Sign in the user
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    self.showError("Failed to sign in: \(error.localizedDescription)")
                } else {
                    self.transitionToHome()
                }
            }
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func validateFields() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                return "Please fill in all fields."
            }
            return nil
        }

        func showError(_ message: String) {
            errorLabel.text = message
            errorLabel.alpha = 1
        }

        func transitionToHome() {
            // Transition to the home screen
            let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                view.window?.rootViewController = homeViewController
                view.window?.makeKeyAndVisible()
        }
    }
