//
//  main.swift
//  day17
//
//  Created by Jerry Hsu on 12/17/21.
//

import Foundation

struct Target {
    let xMin, xMax, yMin, yMax: Int
    
    func contains(point: Point) -> Bool {
        return point.x >= xMin && point.x <= xMax
        && point.y >= yMin && point.y <= yMax
    }
}

struct Point {
    var x: Int
    var y: Int
}

let sample = Target(xMin: 20, xMax: 30, yMin: -10, yMax: -5)
let actual = Target(xMin: 96, xMax: 125, yMin: -144, yMax: -98)

struct Result {
    let time: Int
    let hit: Bool
    let maxY: Int
}

func test(initialVector: Point, target: Target) -> Result {
    var location = Point(x: 0, y: 0)
    var vector = initialVector
    var time = 0
    var maxY = 0
    while location.y >= target.yMin {
        time += 1
        location.x += vector.x
        location.y += vector.y
        maxY = max(location.y, maxY)
        vector.x = max(vector.x - 1, 0)
        vector.y -= 1
        if target.contains(point: location) {
            return Result(time: time, hit: true, maxY: maxY)
        }
    }
    return Result(time: time, hit: false, maxY: maxY)
}

func search(target: Target) {
    var bestResult: Result = Result(time: 0, hit: false, maxY: 0)
    for x in 1...1000 {
        for y in 1...1000 {
            let result = test(initialVector: Point(x: x, y: y), target: target)
            if result.hit && bestResult.maxY < result.maxY {
                bestResult = result
                print("\(bestResult)")
            }
        }
    }
}

func search2(target: Target) {
//    var bestResult: Result = Result(time: 0, hit: false, maxY: 0)
    var count = 0
    for x in 1...200 {
        for y in -200...200 {
            let result = test(initialVector: Point(x: x, y: y), target: target)
            if result.hit {
                count += 1
            }
        }
    }
    print(count)
}

//print(test(initialVector: Point(x: 6, y: 9), target: sample))
//search(target: actual)
//search2(target: sample)
search2(target: actual)
