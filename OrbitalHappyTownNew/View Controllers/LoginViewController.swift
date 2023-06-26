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
    @IBOutlet weak var loginLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the placeholders for the text fields
            emailTextField.placeholder = "Email"
            passwordTextField.placeholder = "Password"

        // Create an image view
                let imageView = UIImageView(image: UIImage(named: "Flowers"))
                imageView.contentMode = .scaleAspectFit
                
                // Add the image view to the view controller's view
                view.addSubview(imageView)
                
                // Set the position and constraints of the image view
                imageView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50), // Place slightly lower with a constant value of 50
                    imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    imageView.heightAnchor.constraint(equalToConstant: 200)
                ])
        
        

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
                        // If sign-in fails, create a new user account
                        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                            if let error = error {
                                self.showError("Failed to create an account: \(error.localizedDescription)")
                            } else {
                                self.transitionToHome()
                            }
                        }
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
