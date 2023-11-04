//
//  SettingsViewController.swift
//  TabooGame
//
//  Created by Necati Alperen IŞIK on 9.10.2023.
//

import UIKit

class SettingsViewController: UIViewController,UITextFieldDelegate{
    
    
    @IBOutlet weak var teamOneNameTextField: UITextField!
    @IBOutlet weak var teamTwoNameTextField: UITextField!
    
    @IBOutlet weak var timeSlider: UISlider!
    
    @IBOutlet weak var userTimeLabel: UILabel!
    
    var tabooBrain = TabooBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func saveSettingsClicked(_ sender: Any) {
        tabooBrain.addTeams(team1Name: teamOneNameTextField.text ?? "", team2Name: teamTwoNameTextField.text ?? "", timeRemaining: 10)
    }
    
    
    @IBAction func timeSliderChanged(_ sender: UISlider) {
        let selectedTime = Int(sender.value)
        userTimeLabel.text = "\(selectedTime)"
    }
    
    
    
    
    @IBAction func startGameClicked(_ sender: Any) {
        tabooBrain.startGame()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            let destVC = segue.destination as? GameViewController
            destVC?.tabooBrain.teams = self.tabooBrain.teams
        }
    }
    
    
    
}
    
    
    
    



