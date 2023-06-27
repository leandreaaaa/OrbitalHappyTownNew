//
//  MusicViewController.swift
//  OrbitalHappyTownNew
//
//  Created by Leandrea De Conceicao on 18/6/23.
//

import UIKit

class MusicViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var activitiesButton: UIButton!
    
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var moodTrackerButton: UIButton!
    @IBOutlet weak var journallingButton: UIButton!
    
    @IBOutlet weak var studyButton: UIButton!
    @IBOutlet weak var classicalButton: UIButton!
    @IBOutlet weak var soothingButton: UIButton!
    @IBOutlet weak var pianoButton: UIButton!
    @IBOutlet weak var relaxationButton: UIButton!
    @IBOutlet weak var nighttimeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set images for buttons
        let imageSize = CGSize(width: 100, height: 90)
        
        studyButton.setImage(UIImage(named: "StudySessions.png")?.resized(to: imageSize), for: .normal)
        classicalButton.setImage(UIImage(named: "Classical.png")?.resized(to: imageSize), for: .normal)
        soothingButton.setImage(UIImage(named: "Soothing.png")?.resized(to: imageSize), for: .normal)
        pianoButton.setImage(UIImage(named: "PianoDeepSleep.png")?.resized(to: imageSize), for: .normal)
        relaxationButton.setImage(UIImage(named: "RelaxationMusic.png")?.resized(to: imageSize), for: .normal)
        nighttimeButton.setImage(UIImage(named: "Nighttime.png")?.resized(to: imageSize), for: .normal)
        
        
        /// Add margins around the button's title and image
        
        //Study Button
        studyButton.configuration?.titlePadding = 10
        studyButton.configuration?.imagePadding = 10
        studyButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        studyButton.configuration?.imagePlacement = .bottom
        studyButton.setTitle("Study Sessions", for: .normal)
        studyButton.setTitleColor(.black, for: .normal)
        studyButton.titleLabel?.font = UIFont(name: "BalooBhai-Regular", size: 25)
        studyButton.titleLabel?.textAlignment = .center
        
        //Classical Button
        classicalButton.configuration?.titlePadding = 10
        classicalButton.configuration?.imagePadding = 10
        classicalButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        classicalButton.configuration?.imagePlacement = .bottom
        classicalButton.setTitle("Classical for Easing Stress", for: .normal)
        classicalButton.setTitleColor(.black, for: .normal)
        classicalButton.titleLabel?.font = UIFont(name: "BalooBhai-Regular", size: 25)
        classicalButton.titleLabel?.textAlignment = .center
        
        //soothing Button
        soothingButton.configuration?.titlePadding = 10
        soothingButton.configuration?.imagePadding = 10
        soothingButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        soothingButton.configuration?.imagePlacement = .bottom
        soothingButton.setTitle("Soothing Music to Release Anxiety", for: .normal)
        soothingButton.setTitleColor(.black, for: .normal)
        soothingButton.titleLabel?.font = UIFont(name: "BalooBhai-Regular", size: 25)
        soothingButton.titleLabel?.textAlignment = .center
        
        //piano Button
        pianoButton.configuration?.titlePadding = 10
        pianoButton.configuration?.imagePadding = 10
        pianoButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        pianoButton.configuration?.imagePlacement = .bottom
        pianoButton.setTitle("Piano for Deep Sleep", for: .normal)
        pianoButton.setTitleColor(.black, for: .normal)
        pianoButton.titleLabel?.font = UIFont(name: "BalooBhai-Regular", size: 25)
        pianoButton.titleLabel?.textAlignment = .center
        
        //Study Button
        relaxationButton.configuration?.titlePadding = 10
        relaxationButton.configuration?.imagePadding = 10
        relaxationButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        relaxationButton.configuration?.imagePlacement = .bottom
        relaxationButton.setTitle("Music for Relaxation", for: .normal)
        relaxationButton.setTitleColor(.black, for: .normal)
        relaxationButton.titleLabel?.font = UIFont(name: "BalooBhai-Regular", size: 25)
        relaxationButton.titleLabel?.textAlignment = .center
        
        
        //Study Button
        nighttimeButton.configuration?.titlePadding = 10
        nighttimeButton.configuration?.imagePadding = 10
        nighttimeButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        nighttimeButton.configuration?.imagePlacement = .bottom
        nighttimeButton.setTitle("Nighttime Wind Down", for: .normal)
        nighttimeButton.setTitleColor(.black, for: .normal)
        nighttimeButton.titleLabel?.font = UIFont(name: "BalooBhai-Regular", size: 25)
        nighttimeButton.titleLabel?.textAlignment = .center
        
    }
    
  
    
    
    
    // Button actions
    
    @IBAction func profileButtonTapped(_ sender: Any) {
    }
    @IBAction func activityButtonTapped(_ sender: Any) {
    }
    @IBAction func moodTrackerButtonTapped(_ sender: Any) {
    }
    @IBAction func journallingButtonTapped(_ sender: Any) {
    }
    
    //buttons
    @IBAction func studyButtonTapped(_ sender: Any) {
    }
    @IBAction func classicalButtonTapped(_ sender: Any) {
    }
    
    @IBAction func soothingButtonTapped(_ sender: Any) {
    }
    @IBAction func pianoButtonTapped(_ sender: Any) {
    }
    
    @IBAction func relaxationButtonTapped(_ sender: Any) {
    }
    @IBAction func nighttimeButtonTapped(_ sender: Any) {
    }
    
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return resizedImage.withRenderingMode(renderingMode)
    }
}


