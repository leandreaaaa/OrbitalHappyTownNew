//
//  HistoryViewController.swift
//  OrbitalHappyTownNew
//
//  Created by Leandrea De Conceicao on 23/6/23.
//
import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Create variables to store the journal entries and mood history
    var journalEntries: [String] = []
    var moodHistory: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    @IBAction func historyButtonTapped(_ sender: Any) {
        if let historyVC = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController {
            historyVC.journalEntries = journalEntries // Pass journal entries
            historyVC.moodHistory = moodHistory // Pass mood history
            
            self.navigationController?.pushViewController(historyVC, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the total number of rows based on the combined count of journal entries and mood history
        return journalEntries.count + moodHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        
        if indexPath.row < journalEntries.count {
            // Configure the cell for displaying journal entries
            let journalEntry = journalEntries[indexPath.row]
            cell.textLabel?.text = journalEntry
            cell.detailTextLabel?.text = "Journal Entry"
        } else {
            // Configure the cell for displaying mood history
            let moodIndex = indexPath.row - journalEntries.count
            let mood = moodHistory[moodIndex]
            cell.textLabel?.text = mood
            cell.detailTextLabel?.text = "Mood"
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection if needed
    }
}
