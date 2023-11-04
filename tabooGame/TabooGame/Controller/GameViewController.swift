//
//  GameViewController.swift
//  TabooGame
//
//  Created by Necati Alperen IŞIK on 9.10.2023.
//

import UIKit

protocol TabooBrainDelegate {
    func updateUI()
    func startTimer()
}

class GameViewController: UIViewController,TabooBrainDelegate {
    
    @IBOutlet weak var titleWordLabel: UILabel!
    @IBOutlet weak var forbiddenWordOneLabel: UILabel!
    @IBOutlet weak var forbiddenWordTwoLabel: UILabel!
    @IBOutlet weak var forbiddenWordThreeLabel: UILabel!
    @IBOutlet weak var forbiddenWordFourLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var passAmountLabel: UILabel!
    
    
    var tabooBrain = TabooBrain()
    var timer :Timer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabooBrain.delegate = self
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
        updateUI()
    }
    
    @objc func step(){
        
        if tabooBrain.timeRemaining > 0{
            tabooBrain.timeRemaining -= 1
            timeLabel.text = "Time : \(tabooBrain.timeRemaining)"
        }else{
            performSegue(withIdentifier: "timesUp", sender: nil)
            timer.invalidate()
            tabooBrain.changeTurn()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "timesUp" {
            if let teamChangeVC = segue.destination as? teamChangeViewController {
                teamChangeVC.tabooBrain = self.tabooBrain
                teamChangeVC.team1Score = self.tabooBrain.team1Score
                teamChangeVC.team2Score = self.tabooBrain.team2Score
            }
        }
    }
    
    
    @IBAction func trueButtonClicked(_ sender: Any) {
        tabooBrain.nextQuestionTitle()
        let score = tabooBrain.increaseScore()
        scoreLabel.text = "Total Score : \(score)"
    }
    
    
    @IBAction func passButtonClicked(_ sender: Any) {
        if tabooBrain.passAmount <= 2{
            tabooBrain.passAmount += 1
            tabooBrain.nextQuestionTitle()

        }else{
            print("pas hakkı doldu")
            
        }
    }
        
    @IBAction func tabooButtonClicked(_ sender: Any) {
        tabooBrain.nextQuestionTitle()
        let score = tabooBrain.decreaseScore()
        scoreLabel.text = "Total Score : \(score)"
    }
    
    func updateLabels(){
        scoreLabel.text = ""
        // takımlar değiştiğinde skoru sıfırlamak için
    }
    func updateUI() {
        passAmountLabel.text = "\(tabooBrain.passAmount) / 3"
        let question = tabooBrain.questions[tabooBrain.questionNumber]
        titleWordLabel.text = question.title
        forbiddenWordOneLabel.text = question.forbiddenWords[0]
        forbiddenWordTwoLabel.text = question.forbiddenWords[1]
        forbiddenWordThreeLabel.text = question.forbiddenWords[2]
        forbiddenWordFourLabel.text = question.forbiddenWords[3]
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }

}
