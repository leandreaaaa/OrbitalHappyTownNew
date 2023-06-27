//
//  HomeViewController.swift
//  OrbitalHappyTownNew
//
//  Created by Leandrea De Conceicao on 29/5/23.
//
//
//  HomeViewController.swift
//  OrbitalHappyTownNew
//
//  Created by Leandrea De Conceicao on 29/5/23.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    //Buttons
    @IBOutlet weak var homePageLabel: UILabel!
    @IBOutlet weak var activitiesButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var moodTrackerButton: UIButton!
    @IBOutlet weak var journallingButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var managingAnxietyButton: UIButton!
    @IBOutlet weak var kindnessTowardsButton: UIButton!
    @IBOutlet weak var findingJoyButton: UIButton!
    @IBOutlet weak var breathingButton: UIButton!
    
    @IBOutlet weak var meditationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set images for buttons
        let imageSize = CGSize(width: 100, height: 90)
        
        managingAnxietyButton.setImage(UIImage(named: "ManagingAnxiety.png")?.resized(to: imageSize), for: .normal)
        kindnessTowardsButton.setImage(UIImage(named: "KindnessTowardsYourself.png")?.resized(to: imageSize), for: .normal)
        findingJoyButton.setImage(UIImage(named: "FindingJoy.png")?.resized(to: imageSize), for: .normal)
        breathingButton.setImage(UIImage(named: "Breathing.png")?.resized(to: imageSize), for: .normal)
        meditationButton.setImage(UIImage(named: "Meditation.png")?.resized(to: imageSize), for: .normal)
        
        // Add margins around the button's title and image
        
        // Managing Anxiety Button
        configureButton(managingAnxietyButton, withTitle: "Managing Anxiety")
        
        // Kindness Towards Button
        configureButton(kindnessTowardsButton, withTitle: "Kindness Towards Yourself")
        
        // Finding Joy Button
        configureButton(findingJoyButton, withTitle: "Finding Joy")
        
        
        // Breathing Button
        configureButton(breathingButton, withTitle: "Breathing Exercises")
        
        // Meditation Button
        configureButton(meditationButton, withTitle: "Meditation for Beginners")
        
        // Move all elements up
        let verticalOffset: CGFloat = -100
        moveElementsUp(withOffset: verticalOffset)
    }
    
    func configureButton(_ button: UIButton, withTitle title: String) {
        button.configuration?.titlePadding = 10
        button.configuration?.imagePadding = 10
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        button.configuration?.imagePlacement = .bottom
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "BalooBhai-Regular", size: 25)
        button.titleLabel?.textAlignment = .center
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .top
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 60, left: -button.frame.size.width, bottom: 0, right: 0)
    }
    
    func moveElementsUp(withOffset offset: CGFloat) {
        // Move each element up by the given offset
        let elements: [UIView] = [
            homePageLabel,
            activitiesButton,
            musicButton,
            moodTrackerButton,
            journallingButton,
            profileButton,
            managingAnxietyButton,
            kindnessTowardsButton,
            findingJoyButton,
            breathingButton,
            meditationButton
        ]
        
        elements.forEach { element in
            element.frame = element.frame.offsetBy(dx: 0, dy: offset)
        }
    }
    
    //Actions

    @IBAction func profileButtonTapped(_ sender: Any) {
    }
    @IBAction func activitiesButtonTapped(_ sender: Any) {
    }
    @IBAction func musicButtonTapped(_ sender: Any) {
    }
    @IBAction func moodTrackerButtonTapped(_ sender: Any) {
    }
    @IBAction func journallingButtonTapped(_ sender: Any) {
    }
    
    @IBAction func managingAnxietyButtonTapped(_ sender: Any) {
    }
    
    @IBAction func kindnessTowardsButtonTapped(_ sender: Any) {
    }
    @IBAction func findingJoyButtonTapped(_ sender: Any) {
    }
    
    @IBAction func breathingButtonTapped(_ sender: Any) {
    }
    @IBAction func meditationButtonTapped(_ sender: Any) {
    }
}



