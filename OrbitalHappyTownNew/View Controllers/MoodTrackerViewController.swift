//
//  MoodTrackerViewController.swift
//  OrbitalHappyTownNew
//
//  Created by Leandrea De Conceicao on 13/6/23.
//

import UIKit

class MoodTrackerViewController: UIViewController {
    
    @IBOutlet weak var greatButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var okayButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var awfulButton: UIButton!
    @IBOutlet weak var unsureButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
        
        var moodHistory: [String] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let buttons = [greatButton, goodButton, okayButton, badButton, awfulButton, unsureButton]
        let images = ["AwesomeImage", "GoodImage", "OkayImage", "SadImage", "AngryImage", "NeutralImage"] // Assuming you have these images in your assets
        let titles = ["Awesome", "Good", "Okay", "Sad", "Angry", "Neutral"] // Your button titles
        
        let imageSize = CGSize(width: 50, height: 50) // Adjust this to the desired size
        
        for (index, button) in buttons.enumerated() {
            button?.backgroundColor = UIColor.white
            button?.layer.cornerRadius = 10 // Adjust this value to your liking
            button?.titleLabel?.font = UIFont(name: "BalooBhai-Regular", size: 14.76)
            button?.setTitle(titles[index], for: .normal)
            
            if let originalImage = UIImage(named: images[index]) {
                let resizedImage = originalImage.resized(to: imageSize)
                button?.setImage(resizedImage, for: .normal)
            }
            
            button?.imageEdgeInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: 0)
            button?.titleEdgeInsets = UIEdgeInsets(top: 10, left: -((button?.imageView?.frame.width)!), bottom: 0, right: 0)
            
            button?.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    // Button actions
    @IBAction func moodButtonTapped(_ sender: UIButton) {
        guard let moodTitle = sender.titleLabel?.text else {
            return
        }
        
        addMoodToHistory(moodTitle)
        
        // Pass the updated mood history to the HistoryViewController
        if let historyVC = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController {
            historyVC.moodHistory = moodHistory
            navigationController?.pushViewController(historyVC, animated: true)
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        // Perform any necessary actions when the close button is tapped
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
    }
    
    
    // Function to add mood to history
    func addMoodToHistory(_ mood: String) {
        moodHistory.append(mood)
    }
}

// Helper function for resizing images
extension UIImage {
    func resized(to size: CGSize, renderingMode: UIImage.RenderingMode) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return resizedImage.withRenderingMode(renderingMode)
    }
}
