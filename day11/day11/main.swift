//
//  main.swift
//  day11
//
//  Created by Jerry Hsu on 12/11/21.
//

import Foundation

let sample = """
5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
"""

let data = """
3113284886
2851876144
2774664484
6715112578
7146272153
6256656367
3148666245
3857446528
7322422833
8152175168
"""

struct Point: Equatable, Hashable {
    let x, y: Int
    
    var surrounding: [Point] {
        return [
            Point(x: x+0, y: y+1),
            Point(x: x+1, y: y+1),
            Point(x: x+1, y: y+0),
            Point(x: x+1, y: y-1),
            Point(x: x+0, y: y-1),
            Point(x: x-1, y: y+1),
            Point(x: x-1, y: y+0),
            Point(x: x-1, y: y-1)
        ]
    }
}

func parse(input: String) -> [Point:Int] {
    var result: [Point:Int] = [:]
    for (y, line) in input.split(separator: "\n").enumerated() {
        for (x, char) in line.enumerated() {
            result[Point(x: x, y: y)] = Int(String(char))!
        }
    }
    return result
}

func step(start: [Point:Int]) -> ([Point:Int], Int) {
    let current = start.reduce(into: [:]) { partialResult, keyValue in
        partialResult[keyValue.key] = keyValue.value + 1
    }
    var result = current
    
    var seenFlashes = Set<Point>()
    var lastFlashCount = -1
    while lastFlashCount != seenFlashes.count {
        lastFlashCount = seenFlashes.count
        for point in result.keys {
            if result[point, default: 0] > 9 && !seenFlashes.contains(point) {
                seenFlashes.insert(point)
                point.surrounding.forEach { nextPoint in
                    if let newValue = result[nextPoint] {
                        result[nextPoint] = newValue + 1
                    }
                }
            }
        }
    }
    var flashes = 0
    for point in current.keys {
        if result[point, default: 0] > 9 {
            result[point] = 0
            flashes += 1
        }
    }
    return (result, flashes)
}

func print(map: [Point:Int], size: Int = 10) {
    for y in 0..<size {
        for x in 0..<size {
            print(map[Point(x: x, y: y), default: 0], terminator: "")
        }
        print()
    }
}

func run100(input: String) {
    let start = parse(input: input)
    var totalFlashes = 0
    var current = start
    for i in 0..<100 {
        var newFlashes: Int
        (current, newFlashes) = step(start: current)
        totalFlashes += newFlashes
    }
    print(totalFlashes)
}

func runUntilAll(input: String) {
    let start = parse(input: input)
    var seenFlashes = 0
    var current = start
    var count = 0
    while seenFlashes != 100 {
        count += 1
        var newFlashes: Int
        (current, newFlashes) = step(start: current)
            seenFlashes = newFlashes
    }
    print(count)
}

//run100(input: sample)
//run100(input: data)
//runUntilAll(input: sample)
runUntilAll(input: data)
