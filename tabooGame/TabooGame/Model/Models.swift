//
//  Models.swift
//  TabooGame
//
//  Created by Necati Alperen IŞIK on 10.10.2023.
//

import Foundation

struct Question{
    let title : String
    let forbiddenWords: [String]
}



struct Teams{
    var team1Name : String
    var team2Name : String
    var team1Score : Int
    var team2Score : Int
    var passAmount : Int
    var timeRemaining :Int
}
