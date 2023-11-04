//
//  TabooBrain.swift
//  TabooGame
//
//  Created by Necati Alperen IŞIK on 9.10.2023.
//

import Foundation
import UIKit


class TabooBrain{
    
    var delegate : TabooBrainDelegate?
    var questionNumber = 0
    var team1Score : Int = 0
    var team2Score : Int = 0
    var passAmount : Int = 0
    var isFirsTeamTurn : Bool = true
    var timeRemaining : Int = 10
    
    var teams : Teams?
    
    let questions = [
    Question(title: "afacan", forbiddenWords: ["yaramaz","çocuk","şımarık","ufaklık"]),
    Question(title: "meyve", forbiddenWords: ["elma","sebze","portakal","muz"]),
    Question(title: "bardak", forbiddenWords: ["çay","su","cam","karton"]),
    Question(title: "telefon", forbiddenWords: ["mobil","arama","iphone","gsm"]),
    ]
    
    
     func startGame (){
        isFirsTeamTurn = true
        team1Score = 0
        team2Score = 0
        passAmount = 3
        timeRemaining = 10
        
        delegate?.updateUI()
         delegate?.startTimer()
    }
    
    func addTeams(team1Name : String,team2Name : String,timeRemaining: Int) {
        self.teams = Teams(team1Name: team1Name, team2Name: team2Name,team1Score: 0,team2Score: 0,passAmount: 3, timeRemaining: timeRemaining )
    }
    
    
    
    func getQuestionTitle()->String{
        return questions[questionNumber].title
    }
    
    
    
    func getForbiddenWords()->String{
        return questions[questionNumber].forbiddenWords[0]
        
    }
    
    
    
     func nextQuestionTitle(){
        if questionNumber + 1 < questions.count{
            questionNumber += 1
        }else{
            questionNumber = 0
        }
         delegate?.updateUI()
    }
    
    
    
     func increaseScore()->Int{
        if isFirsTeamTurn {
            team1Score += 1
        }else{
            team2Score += 1
        }
        return isFirsTeamTurn  ? team1Score : team2Score
    }
    
    
    
     func decreaseScore()->Int{
        if isFirsTeamTurn   {
            team1Score -= 1
        }else{
            team2Score -= 1
        }
        return isFirsTeamTurn  ? team1Score : team2Score
    }
    
    
    
     func passButton(){
        if passAmount <= 2{
            passAmount += 1
            print(passAmount)
        
        }else{
            print("pas hakkı doldu")
        }
    }
    
    
     func changeTurn(){
        isFirsTeamTurn.toggle()
         self.passAmount = 0
         delegate?.updateUI()
         delegate?.startTimer()
         
    }
    
    
}
