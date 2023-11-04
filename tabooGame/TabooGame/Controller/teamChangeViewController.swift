//
//  teamChangeViewController.swift
//  TabooGame
//
//  Created by Necati Alperen IŞIK on 14.10.2023.
//

import UIKit

class teamChangeViewController: UIViewController {
    
    @IBOutlet weak var team1NameLabel: UILabel!
    @IBOutlet weak var team2NameLabel: UILabel!
    @IBOutlet weak var team1ScoreLabel: UILabel!
    @IBOutlet weak var team2ScoreLabell: UILabel!
    
    var team1Score : Int = 0
    var team2Score : Int = 0
    var tabooBrain = TabooBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        team1ScoreLabel.text = "\(team1Score)"
        team2ScoreLabell.text = "\(team2Score)"
        team1NameLabel.text = "\(tabooBrain.teams?.team1Name ?? "team1")"
        team2NameLabel.text = "\(tabooBrain.teams?.team2Name ?? "team2")"
    }
    
    @IBAction func continueGameClicked(_ sender: Any) {
        
        if let presentingViewController = presentingViewController as? GameViewController{
            presentingViewController.tabooBrain.timeRemaining = 10
            tabooBrain.changeTurn()
            presentingViewController.updateUI()
            presentingViewController.updateLabels()
            dismiss(animated: true,completion: nil)
            
        }
        
    }
    
}
