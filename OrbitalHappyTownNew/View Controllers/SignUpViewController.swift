//
//  SignUpViewController.swift
//  OrbitalHappyTownNew
//
//  Created by Leandrea De Conceicao on 29/5/23.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var signUpLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set up the placeholders for the text fields
        firstNameTextField.placeholder = "First Name"
        lastNameTextField.placeholder = "Last Name"
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        
            
        // Set up UI customization
        customizeUI()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func customizeUI() {
        // Reduce the size of the image
            let imageView = UIImageView(image: UIImage(named: "Flowers"))
            imageView.contentMode = .scaleAspectFit
            view.addSubview(imageView)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 150),
                imageView.heightAnchor.constraint(equalToConstant: 150)
            ])
            
        


        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        // Hide the error label
        errorLabel.alpha = 0
    }
    
    // Check fields and validate that data is correct.
    // If everything is correct, this method returns nil. If not, returns error message
    func validateFields() -> String? {
            // Check that all fields are filled in
            if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                return "Please fill in all fields."
            }

            // Checking if first name contains only letters
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let firstNameRegex = "^[a-zA-Z]+$"
            let firstNamePredicate = NSPredicate(format: "SELF MATCHES %@", firstNameRegex)
            if !firstNamePredicate.evaluate(with: firstName) {
                return "Please enter a valid first name."
            }

            // Checking if last name contains only letters
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastNamePredicate = NSPredicate(format: "SELF MATCHES %@", firstNameRegex)
            if !lastNamePredicate.evaluate(with: lastName) {
                return "Please enter a valid last name."
            }

            // Checking validity of email
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            if !isValidEmail(email) {
                return "Please enter a valid email address."
            }

            // Check if password is strong enough
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            if !isPasswordValid(password) {
                return "Ensure your password is at least 8 characters long, contains a special character and a number."
            }

            return nil
        }

        func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }

        func isPasswordValid(_ password: String) -> Bool {
            let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            return passwordPredicate.evaluate(with: password)
        }

    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()

        if let error = error {
            showError(error)
        } else {
            // Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            // Creating the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    self.showError("Error creating user: \(error.localizedDescription)")
                } else {
                    // User created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "firstname": firstName,
                        "lastname": lastName,
                        "uid": result!.user.uid
                    ]) { error in
                        if let error = error {
                            self.showError("Error saving user data: \(error.localizedDescription)")
                        } else {
                            self.transitionToHome()
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
   

        func showError(_ message: String) {
            errorLabel.text = message
            errorLabel.alpha = 1
        }

        func transitionToHome() {
            let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
            view.window?.rootViewController = homeViewController
            view.window?.makeKeyAndVisible()
        }
}



