//
//  ViewController.swift
//  OrbitalHappyTownNew
//
//  Created by Leandrea De Conceicao on 29/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        setUpElements()
        
        // Create an image view
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 220, height: 220))
        imageView.contentMode = .scaleAspectFit
        
        // Set the image
        let logoImage = UIImage(named: "HappyTownLogo") // Replace "your_logo_image" with the actual name of your image
        imageView.image = logoImage
        
        // Add the image view to the view controller's view
        view.addSubview(imageView)
        
        // Set the position and constraints of the image view
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250), // Adjust the constant value to set the desired distance from the top
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    func setUpElements() {
        let signUpAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: signUpButton.titleLabel?.font.pointSize ?? 17.0)
        ]
        let signUpAttributedText = NSAttributedString(string: "SIGN UP", attributes: signUpAttributes)
        signUpButton.setAttributedTitle(signUpAttributedText, for: .normal)
        
        let loginAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: loginButton.titleLabel?.font.pointSize ?? 17.0)
        ]
        let loginAttributedText = NSAttributedString(string: "LOGIN", attributes: loginAttributes)
        loginButton.setAttributedTitle(loginAttributedText, for: .normal)
        
        loginButton.backgroundColor = UIColor.clear
        loginButton.titleLabel?.textAlignment = .center
        loginButton.setTitleColor(UIColor.red, for: .normal)
    }
}
