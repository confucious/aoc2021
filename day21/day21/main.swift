//
//  main.swift
//  day21
//
//  Created by Jerry Hsu on 12/21/21.
//

import Foundation

struct Game {
    struct PlayerState {
        var score = 0
        var position: Int
        
        mutating func advance(distance: Int) {
            position = (position - 1 + distance) % 10 + 1
            score += position
        }
    }
    
    var p1: PlayerState
    var p2: PlayerState
    var nextDieValue = 1
    var turn = 1
    var numRolls = 0
    
    mutating func rollDie() -> Int {
        let value = nextDieValue
        nextDieValue = (nextDieValue % 100) + 1
        numRolls += 1
        return value
    }

    mutating func next() {
        let value = rollDie() + rollDie() + rollDie()
        if turn == 1 {
            p1.advance(distance: value)
        } else {
            p2.advance(distance: value)
        }
        turn = 3 - turn
    }
    
}

//Player 1 starting position: 7
//Player 2 starting position: 10

var sample = Game(p1: .init(position: 4), p2: .init(position: 8))
var real = Game(p1: .init(position: 7), p2: .init(position: 10))

func run(game: Game) -> Game {
    var game = game
    while game.p1.score < 1000 && game.p2.score < 1000 {
        game.next()
    }
    
    print(game.numRolls * (game.p1.score >= 1000 ? game.p2.score : game.p1.score))
    return game
}

print(run(game: real))
