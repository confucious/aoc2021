//
//  main.swift
//  day23
//
//  Created by Jerry Hsu on 12/23/21.
//

import Foundation
/*
 01234567890123
2###B#C#B#D###
3  #A#D#C#A#
   #########
 */
let sample = """
#############
#...........#
###B#C#B#D###
  #A#D#C#A#
  #########
"""

let sample2 = """
#############
#...........#
###B#C#B#D###
  #D#C#B#A#
  #D#B#A#C#
  #A#D#C#A#
  #########
"""

struct Point: Equatable & Hashable {
    let col, row: Int
}

struct Walker: Equatable & Hashable {
    enum WalkerType: String {
        case a = "A"
        case b = "B"
        case c = "C"
        case d = "D"
        
        var targetColumn: Int {
            switch self {
                case .a: return 3
                case .b: return 5
                case .c: return 7
                case .d: return 9
            }
        }
        
        var movementCost: Int {
            switch self {
                case .a: return 1
                case .b: return 10
                case .c: return 100
                case .d: return 1000
            }
        }
    }
    enum WalkerState: Equatable {
        case initial
        case inHall
        case final
    }
    let type: WalkerType
    var state: WalkerState
    var position: Point
    var energySpent: Int = 0
    
    func costOfPath(to point: Point, map: [Point:Element]) -> Int? {
        var distance = 0
        let hallClear: Bool
        if point.col < position.col {
            hallClear = (point.col ..< position.col).allSatisfy({ index in
                map[Point(col: index, row: 1)] == .available
            })
        } else {
            hallClear = ((position.col+1) ... point.col).allSatisfy({ index in
                map[Point(col: index, row: 1)] == .available
            })
        }
        guard hallClear else { return nil }
        distance += abs(point.col - position.col)

        if position.row == 1 {
            guard (2...point.row).allSatisfy({
                map[Point(col: point.col, row: $0)] == .available
            }) else {
                return nil
            }
        } else if position.row == 2 {
            // can always move into hall
        } else {
            guard (2..<position.row).allSatisfy({
                map[Point(col: position.col, row: $0)] == .available
            }) else {
                return nil
            }
        }
        distance += abs(point.row - position.row)
        return distance * type.movementCost
    }
    
    func nextStates(globalState: State) -> [State] {
        switch state {
            case .final:
                return []
            case .initial:
                return validHallStates(globalState: globalState)
            case .inHall:
                return validFinalState(globalState: globalState)
        }
    }
    
    func validHallStates(globalState: State) -> [State] {
        let possibleCols = [1, 2, 4, 6, 8, 10, 11]
        let possiblePoints: [Point] = possibleCols.map { Point(col: $0, row: 1) }
        var hallWalker = self
        hallWalker.state = .inHall
        return possiblePoints.compactMap { finalPoint in
            if let cost = costOfPath(to: finalPoint, map: globalState.map) {
                return globalState.move(walker: hallWalker, to: finalPoint, cost: cost)
            } else {
                return nil
            }
        }
    }
    
    func validFinalState(globalState: State) -> [State] {
        var finalPoint: Point = Point(col: type.targetColumn, row: 2)
        for row in [3,4,5] {
            switch globalState.map[Point(col: type.targetColumn, row: row)] {
                case .available:
                    finalPoint = Point(col: type.targetColumn, row: row)
                case .walker(let walker):
                    if walker.type != type {
                        // there's a walker there that needs to move out first.
                        return []
                    }
                default:
                    fatalError("should only be considering available or walker spaces \(type.targetColumn) \(row)")
            }
        }
        
        if let cost = costOfPath(to: finalPoint, map: globalState.map) {
            var finalWalker = self
            finalWalker.state = .final
            return [globalState.move(walker: finalWalker, to: finalPoint, cost: cost)]
        } else {
            return []
        }
    }
}

enum Element: Equatable, Hashable, CustomDebugStringConvertible {
    case wall
    case available
    case empty
    case walker(Walker)
    
    var debugDescription: String {
        switch self {
            case .wall: return "#"
            case .available: return "."
            case .empty: return " "
            case .walker(let walker): return walker.type.rawValue
        }
    }
}

struct State: Equatable & Hashable {
    var map: [Point:Element]
    var walkers: [Walker] {
        map.values.compactMap { (element) in
            switch element {
                case let .walker(walker):
                    return walker
                default:
                    return nil
            }
        }
    }
    var allDone: Bool {
        walkers.allSatisfy { $0.state == .final }
    }
    var totalCost: Int {
        walkers.map { $0.energySpent }.reduce(0, +)
    }
    
    init(input: String) {
        map = [:]
        for (row, line) in input.components(separatedBy: "\n").enumerated() {
            for (col, char) in line.enumerated() {
                let point = Point(col: col, row: row)
                switch char {
                    case "#":
                        map[point] = .wall
                    case ".":
                        map[point] = .available
                    case " ":
                        map[point] = .empty
                    default:
                        let walkerType = Walker.WalkerType(rawValue: String(char))!
                        let walker = Walker(
                            type: walkerType,
                            state: .initial,
                            position: point)
                        map[point] = .walker(walker)
                }
            }
        }
        cleanupInitialState()
    }
    
    mutating func cleanupInitialState() {
        for walker in walkers {
            if walker.position.row == 1 {
                var newWalker = walker
                newWalker.state = .inHall
                map[walker.position] = .walker(newWalker)
//            } else if walker.position.row == 3 && walker.position.col == walker.type.targetColumn {
//                var newWalker = walker
//                newWalker.state = .final
//                map[walker.position] = .walker(newWalker)
//            } else if walker.position.row == 2 && walker.position.col == walker.type.targetColumn {
//                if case let .walker(otherWalker) = map[Point(col: walker.position.col, row: 3)],
//                   otherWalker.type == walker.type {
//                    var newWalker = walker
//                    newWalker.state = .final
//                    map[walker.position] = .walker(newWalker)
//                }
//            }
            } else if walker.position.row == 5 && walker.position.col == walker.type.targetColumn {
                var newWalker = walker
                newWalker.state = .final
                map[walker.position] = .walker(newWalker)
            } else if walker.position.row == 4 && walker.position.col == walker.type.targetColumn {
                if case let .walker(otherWalker) = map[Point(col: walker.position.col, row: 5)],
                   otherWalker.type == walker.type {
                    var newWalker = walker
                    newWalker.state = .final
                    map[walker.position] = .walker(newWalker)
                }
            } else if walker.position.row == 3 && walker.position.col == walker.type.targetColumn {
                if case let .walker(otherWalker1) = map[Point(col: walker.position.col, row: 5)],
                   otherWalker1.type == walker.type,
                   case let .walker(otherWalker2) = map[Point(col: walker.position.col, row: 4)],
                   otherWalker2.type == walker.type {
                    var newWalker = walker
                    newWalker.state = .final
                    map[walker.position] = .walker(newWalker)
                }
            } else if walker.position.row == 2 && walker.position.col == walker.type.targetColumn {
                if case let .walker(otherWalker1) = map[Point(col: walker.position.col, row: 5)],
                   otherWalker1.type == walker.type,
                   case let .walker(otherWalker2) = map[Point(col: walker.position.col, row: 4)],
                   otherWalker2.type == walker.type,
                   case let .walker(otherWalker3) = map[Point(col: walker.position.col, row: 4)],
                   otherWalker3.type == walker.type {
                    var newWalker = walker
                    newWalker.state = .final
                    map[walker.position] = .walker(newWalker)
                }
            }
        }
    }
    
    func move(walker: Walker, to point: Point, cost: Int) -> State {
        var newState = self
        var newWalker = walker
        newState.map[walker.position] = .available
        newWalker.energySpent += cost
        newWalker.position = point
        newState.map[point] = .walker(newWalker)
        return newState
    }
    
    func nextStates() -> [State] {
        return walkers.flatMap { $0.nextStates(globalState: self) }
    }
    
    func display() {
        print()
        for row in 1...5 {
            for col in 1...11 {
                print(map[Point(col: col, row: row)] ?? "", terminator: "")
            }
            print()
        }
        print(walkers.filter { $0.state == .final }.count)
    }
}

func solve(initial: State) {
    var solvedStates: [State] = []
    var aliveStates = Set([initial])
//    var aliveStates = [initial]
    while !aliveStates.isEmpty {
        let nextStates = aliveStates.flatMap { $0.nextStates() }
//        nextStates.forEach { $0.display() }
        solvedStates.append(contentsOf: nextStates.filter { $0.allDone })
        aliveStates = Set(nextStates.filter { !$0.allDone })
//        aliveStates = nextStates.filter { !$0.allDone }
        print(solvedStates.count, aliveStates.count)
    }
    print(solvedStates.map { $0.totalCost }.sorted().first)
//    solvedStates.forEach { $0.display() }
}

//solve(initial: State(input: sample))

//let initial = State(input: sample)
//initial.display()
//
//initial.nextStates().forEach { $0.display() }

let lastStep = """
#############
#..........D#
###A#B#C#.###
  #A#B#C#D#
  #A#B#C#D#
  #A#B#C#D#
  #########
"""

let finalMinus1 = """
#############
#.........AD#
###.#B#C#.###
  #A#B#C#D#
  #A#B#C#D#
  #A#B#C#D#
  #########
"""

let finalMinus2 = """
#############
#A..D.....AD#
###.#B#C#.###
  #.#B#C#.#
  #A#B#C#D#
  #A#B#C#D#
  #########
"""

let finalMinus3 = """
#############
#AA.D.....AD#
###.#B#C#.###
  #.#B#C#.#
  #.#B#C#D#
  #A#B#C#D#
  #########
"""

let data = """
#############
#...........#
###D#A#C#D###
  #C#A#B#B#
  #########
"""

let data2 = """
#############
#...........#
###D#A#C#D###
  #D#C#B#A#
  #D#B#A#C#
  #C#A#B#B#
  #########
"""

//let initial = State(input: lastStep)
//initial.display()
//initial.nextStates().forEach { $0.display() }

solve(initial: State(input: data2))

