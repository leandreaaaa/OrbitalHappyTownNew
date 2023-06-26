//
//  FindingJoy.swift
//  OrbitalHappyTownNew
//
//  Created by Leandrea De Conceicao on 20/6/23.
//

import UIKit

class FindingJoyViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Create an image view
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        imageView.contentMode = .scaleAspectFit
        
        // Set the image
        let logoImage = UIImage(named: "FindingJoy")
        imageView.image = logoImage
        
        // Add the image view to the view controller's view
        view.addSubview(imageView)
        
        // Set the position and constraints of the image view
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        
    }
    
    //Actions
    
    @IBAction func closeButtonTapped(_ sender: Any) {
    }
    @IBAction func pauseButtonTapped(_ sender: Any) {
    }
}
