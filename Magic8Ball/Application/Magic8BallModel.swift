// Magic8BallModel.swift
//  Magic8Ball
//
//  Created by yuriy on 11. 11. 25.
//

import Foundation

enum Magic8Ball {
    static let answers: [String] = [
        "It is certain",
        "Without a doubt",
        "You may rely on it",
        "Yes, definitely",
        "It is decidedly so",
        "As I see it, yes",
        "Most likely",
        "Outlook good",
        "Yes",
        "Signs point to yes",
        "Reply hazy, try again",
        "Ask again later",
        "Better not tell you now",
        "Cannot predict now",
        "Concentrate and ask again",
        "Don’t count on it",
        "My reply is no",
        "My sources say no",
        "Outlook not so good",
        "Very doubtful"
    ]

    static func randomAnswer() -> String {
        answers.randomElement() ?? "There is no answer"
    }
}
