//
//  main.swift
//  day21
//
//  Created by Jerry Hsu on 12/21/21.
//

import Foundation

struct Game: Equatable & Hashable {
    struct PlayerState: Equatable & Hashable {
        var score = 0
        var position: Int
        
        mutating func advance(distance: Int) {
            position = (position - 1 + distance) % 10 + 1
            score += position
        }
    }
    
    var p1: PlayerState
    var p2: PlayerState
    var turn = 1
    
    mutating func next(value: Int) {
        if turn == 1 {
            p1.advance(distance: value)
        } else {
            p2.advance(distance: value)
        }
        turn = 3 - turn
    }
    
    func next() -> [(game: Game, copies: Int)] {
        var game3 = self
        var game4 = self
        var game5 = self
        var game6 = self
        var game7 = self
        var game8 = self
        var game9 = self
        game3.next(value: 3)
        game4.next(value: 4)
        game5.next(value: 5)
        game6.next(value: 6)
        game7.next(value: 7)
        game8.next(value: 8)
        game9.next(value: 9)
        return [
            (game3, 1),
            (game4, 3),
            (game5, 6),
            (game6, 7),
            (game7, 6),
            (game8, 3),
            (game9, 1)
        ]
    }
    
    var gameWinner: Int? {
        if p1.score >= 21 {
            return 1
        } else if p2.score >= 21 {
            return 2
        } else {
            return nil
        }
    }
    
}

//Player 1 starting position: 7
//Player 2 starting position: 10

var sample = Game(p1: .init(position: 4), p2: .init(position: 8))
var real = Game(p1: .init(position: 7), p2: .init(position: 10))

func run(game: Game) {
    var aliveGames: [Game:Int] = [:]
    aliveGames[game] = 1
    var completedGames: [Game:Int] = [:]
    while !aliveGames.keys.isEmpty {
        var newResults: [Game:Int] = [:]
        for game in aliveGames.keys {
            let startingCopies = aliveGames[game]!
            for (result, copies) in game.next() {
                if result.gameWinner == nil {
                    newResults[result, default: 0] += copies * startingCopies
                } else {
                    completedGames[result, default: 0] += copies * startingCopies
                }
            }
        }
        aliveGames = newResults
    }
    
    print(completedGames.filter { $0.key.gameWinner == 1 }.map { $0.value }.reduce(0, +))
    print(completedGames.filter { $0.key.gameWinner == 2 }.map { $0.value }.reduce(0, +))
    return
}

print(run(game: real))
