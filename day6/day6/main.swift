//
//  main.swift
//  day6
//
//  Created by Jerry Hsu on 12/6/21.
//

import Foundation

let sample = """
3,4,3,1,2
"""

let data = """
1,1,1,2,1,5,1,1,2,1,4,1,4,1,1,1,1,1,1,4,1,1,1,1,4,1,1,5,1,3,1,2,1,1,1,2,1,1,1,4,1,1,3,1,5,1,1,1,1,3,5,5,2,1,1,1,2,1,1,1,1,1,1,1,1,5,4,1,1,1,1,1,3,1,1,2,4,4,1,1,1,1,1,1,3,1,1,1,1,5,1,3,1,5,1,2,1,1,5,1,1,1,5,3,3,1,4,1,3,1,3,1,1,1,1,3,1,4,1,1,1,1,1,2,1,1,1,4,2,1,1,5,1,1,1,2,1,1,1,1,1,1,1,1,2,1,1,1,1,1,5,1,1,1,1,3,1,1,1,1,1,3,4,1,2,1,3,2,1,1,2,1,1,1,1,4,1,1,1,1,4,1,1,1,1,1,2,1,1,4,1,1,1,5,3,2,2,1,1,3,1,5,1,5,1,1,1,1,1,5,1,4,1,2,1,1,1,1,2,1,3,1,1,1,1,1,1,2,1,1,1,3,1,4,3,1,4,1,3,2,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,2,1,5,1,1,1,1,2,1,1,1,3,5,1,1,1,1,5,1,1,2,1,2,4,2,2,1,1,1,5,2,1,1,5,1,1,1,1,5,1,1,1,2,1
"""

func parse(input: String) -> [Int] {
    return input.split(separator: ",").map { Int($0)! }
}

func simulate(data: [Int], days: Int = 80) {
    var counts = Array(repeating: 0, count: 9)
    data.forEach { days in
        counts[days] += 1
    }
    
    for _ in 1...days {
        var newCounts = Array(repeating: 0, count: 9)
        newCounts[8] = counts[0]
        newCounts[7] = counts[8]
        newCounts[6] = counts[7] + counts[0]
        newCounts[5] = counts[6]
        newCounts[4] = counts[5]
        newCounts[3] = counts[4]
        newCounts[2] = counts[3]
        newCounts[1] = counts[2]
        newCounts[0] = counts[1]
        counts = newCounts
        print(newCounts.reduce(0, +))
    }
}

//simulate(data: parse(input: sample))
//simulate(data: parse(input: data))
simulate(data: parse(input: data), days: 256)
