//
//  main.swift
//  day20
//
//  Created by Jerry Hsu on 12/20/21.
//

import Foundation

let sample = """
..#.#..#####.#.#.#.###.##.....###.##.#..###.####..#####..#....#..#..##..##
#..######.###...####..#..#####..##..#.#####...##.#.#..#.##..#.#......#.###
.######.###.####...#.##.##..#..#..#####.....#.#....###..#.##......#.....#.
.#..#..##..#...##.######.####.####.#.#...#.......#..#.#.#...####.##.#.....
.#..#...##.#.##..#...##.#.##..###.#......#.#.......#.#.#.####.###.##...#..
...####.#..#..#.##.#....##..#.####....##...##..#...#......#.#.......#.....
..##..####..#...#.#.#...##..#.#..###..#####........#..####......#..#

#..#.
#....
##..#
..#..
..###
"""

let data = """
#####.#.###.###.#.#.####.#####.####.#..####.##.####
...##......#.##.##.#.#..#.##.###.#.#.#.##.#..#.####
.#.#.##.#..........###.##...#.#...#.#.###..#...##.#
###.##...###.....##..##..##.#......#.#.##.#.#.##.#.
......###.##.#.###.##..##.......##....#.##....#..##
#.######.##...##.##...#.#.##...##.##.#....##.####..
#..#..##.##.#.#..#....#######.###.##...#.####..#.#.
#.##...##..##.#.#.#.##.#.......###..######..###..##
......###..###.#.#.#.......#.....##.#.##..#.##.#.##
.####..#.##....##.#.#..#.####.##.#.#.##...#..##.####.

.###..###..#.####.#....#..##.###.........#.#.#..#.#...##...#.#........##..#..#.##....#.##.#...###.##
.##......#.#..###.######.#.#.######...#..##...#......###..###..####..####..##..#.##.#.#.#....##..##.
.##.##..###..#...###....#...##..#..######...#.#.##.#..####.#..#..###.######.#.#..#..##...##.#.#.#.#.
..#..##..####...###.#...###.#.####...#####...#####.#.#########.##..####...#....##....##..#.#..#...##
.#.#..#.###....###.#.#..###.#..#####.#.###...####.##.###.#..####.###...#...#.##.#..#..#...##....####
######....#..##.#..#.##.#.#.##.#.#####.#..###.#####..#######..##..#..#........##.##..#...#..##..#.##
.#.##########.##...#.###..##...#....#.##..##.###..#####...#..##.#.....##..####.#.#.##..#...#..#.#.#.
.##..#.#..#..##.###..#.#.##..#.#...########.##..#....##...#..#.####.#.#..####..#.#..##.#.......##..#
##..##...###.##..#.#.#.###.#..####.##.....#.###.##.##......#.......#.#####.#..##.#.##.#..##.###.##.#
..#..###.....##..####.......####.###.#..##.##.#######.####..#.######.###.#.#..###..###.##.###.##..#.
.##.#..#..#.####.#.#.#..#....#...##.....##..##..##.##.#..##...#..#...##.###.##.##........#.#..#..###
....#.######.#..#......####.##....##.#..#..##...#...#...#.##...##..###.......##.....#..#..#..#####..
###..##.....##.##.###.##..#.#.###..####.#.#....#.##.#.....#######.##.....#..#####.##..#..#####.##.##
#.#.#..#.#.#..........##.##......#.###...#.###.##.######..#...#...#.......###...#..#.##...#.#.##..##
##...##.###.#.##..##....#.#.#..##.###.##.#...#.#..##..#..##...#..##...##..#.####..#..##.#.#...##....
...#..###.####.#.####.#.#.#....#.##.##..#####..#####.#.####.##..##.###....###..#....#..##.#.#..#..#.
..#.#.###...###...#####.####..#.#...###.###..#.##....#.#.#.....#..#...#..#.##..####......##.#.###...
#.##.....##...#.#...#####.#.##.##..##.#.##....#.##.....#.###..#..##....###.....#####..####..#..##...
#...##....##..#..####...#...###...##.##..##..#....###.#....#########.##..##.#.#.######.###..####.##.
##.#.##.#.#..#......##.#..#...##..#.#..##.###..##.......##..#.#...#.#..#.#.#....##..######.##...#...
.#..##..#....##..#.##..##...#..##...#....#.#.##..#...##.##.#..#.#.#.##.#..#.#.......#.###..######..#
#..##.#.##.#..##...####.##.#...####...##.###..#..#.#.#..###..##.#....#####.###..#...#..#..####...##.
#.####....######.....#.##..####....###.##....###.####...##.#....####.#..##..#..##..#.##.####.#.....#
...#.#.###...####..#..#.#..#.##...###.#.#.##.#...#.#.#.##.##...#.#####.#....#..##.#...#.##....##....
#..##..#.##..#.#.#..#..###.##.....####..##..##..#######...##.#.....##..#...########..#.#.#.....##...
.#...##...##..##.#..##......#.##......#.###.##.##...##....####.##.#.....#.#.#.#.##.#.##.#..#..##..#.
.#..#..###.#.#.##..#..#...#..##..#.##...##..#...######..##.#.######........###.#..##..##..######.##.
#####..##.####.....###.###.########.###...#########..#.#.###.#..#####..#..###.#####.#.....#..##..##.
........#....###..####.#.###...#.###.........#.......#..#.#..###.##.#...#.###.##..#...##.##.##.#.###
.##....##.#..##.##...####..########.#####..#.#.#...#.##..#.##..######.###.#..##.#..#...###..#.##.###
#..#.##.##..#.#.#...##....#.#..#..###...###..#..#..##.#.....#..#..#.#.####...#.####.#.#.#.#.#.....#.
###..##.##..##.###.#.#....#..........##.#....#.#.##......#.##.#...#####.##....#.#.#....#.###.#.####.
###.....##..#....#..##.##....#..##.##.#...#..#.#####.####.#..##...#...##.###..##.####..##...##.####.
#.#..#.#.#.#..#..#.###..###.##.###.#....#..###.#.###.....##..#.#.##.#....#.#.#.#.#...#.##.######.##.
##....###...#...#.######.#.#.#....#..#.###.#.##..##...#.....##.#...##.#.#####.##.#.##########.####..
...#.#.#..###.#....##.#....##.#..##...#.##....#...#####.#.....##..#.##.##.....#.##.#.#..##.##.#..#.#
###.##.########.##..##.#...###.##.##.#.#...##..###...##.##.##.#..#...#.#.##.....##.....#..##.#.#.###
#.###.#......####..###.....#.##.###..###....###.....#..#.#.##.##....#.#....#.######.#...##...######.
#.#####.###..#.#..........#.######.#####.####.##.##....###..#.###.#.......#....##.#.######..#.###.#.
#.#.##..#...##...#..#.#...#.##..#.####.#.......####.##..#.##..##.#....#.#.....#..#..#...#..#.##.#.#.
####.#.##..##....####.#.##.#.##..#.#.#.#####.####.#.##..##.#.####.#..##..#.###.#...#.##...#.#..###..
#.###...#.#...##.####...###..#..##.#.##.#.#.######...##.##.#.####..#.###..#.##...##..##.#.#.#.####.#
....#.##..##..####......###.#.....#....######.#...##..#..##.###...##.#####..#.##...#...##.#.#####.##
..##...#..##.......#.#.###.#...#####........###...#....#...##.##...###....##.##.#..####....##..##.#.
.#..###.##......##..#...##......##.#.##..##..###.#.#.#.##...#...#.#.....#.#.#.......#..###..####.###
...#..#..##...#..##.##.#####.#.##.#.#...##.####.###...###.#.##.##.##..#.##..#..##.#.###....###..####
#......#...#.#.#.#.#..#...#....###.##.##...######....#.###.##..##.##..#.#..#.####.#.####.......##.#.
#.###.#..####....##.##.###.##.#.#######..##.##.#.#..#...#.#..####.##..#.##.#....#....#.##.#.#.##...#
##...###..##.#.##...##..####.#.#.#####.#.#.##..........#....#...#..##.###....###.#.#.###.###....#.#.
###.#.##..#....#.#.#.##.######..####.#...##.##...###..###..##.........##.##.#.###...##.#####...###.#
..###..#.##..######.#....#...##.#.....#..######.....#.####.#..###..#..##.##...##..##....##..###..##.
#.#.#############.#..##.#.#..#####.#.#.....#....####.#....#..##..###.#...#.##...###.##...##...#..##.
##..##........##.#.##.###..#.#.##..#...#.##.###.#.###########..#.#.#.##..#....#....#.#..#...##...#..
#.#.#...##...#.#.##.#..##.#.####.##.#....##..#..#.....#...######.#...##...####.#....#.........#.#...
##..#.#.##...#....#.##..##.##.###.#.....#.########.##.....#....######..##......#.#...##..##.#.####..
.##.....###..######..#...#......#..#....##.##...#.##...#.#.###...##...#.#.#..#.#..#.#..#.##..###.###
#..#....#...###.#..#########..##.#.......#.###..###...#....#..##.########.#....#.#..###.##.#......#.
###..#..##....####...###.....#....###...#.#..#...#..#.#####...#.####.......#.##.#.....##.##...##.###
..###..#.###..#.##.......###..##...##....#.#.##.#.....###..###.#..####.#####.#..#.#...###.#.####.#..
#.##.#..##.####.#####.#.#.#...######.#.#.#....#.#.#.#...#.##.......###...#.#######...##..###.#.###.#
..##.#....#####.#..##.#..#.#.#.#.#####.#.###...#..##.#.#.####.#.#....##..###.#.##....##..#####.###..
.....#####.#..#.#.....##.#..###.#.##..#..#..#...#.#....#.##.#.#..#...####...#.#..#.##.##.##.#.#...#.
##.##.######....#....#..##.##.##..###..##.#..####.#.##.#...##.#.##.###.######..#####.....#.##.##.###
.#.##.#...#..#######.####.....###.#.#.#...###....#.#.#...#..#.#.....###...###.#...#.#.....##..#...##
.#####..##.####.##.###.##.##..##..####...#.#.###....#.#.....#...#####...###.##.####....#.###.##.####
.#...#....###.########.##..##.##.##...###..#...#..###..#..#.#.###.#...#.#..##..###.#.....#...####.#.
#.#.#..#.##..###.#.###.##.##...##.#.##.#.#.##......#.....###.#.####..##.#.##..#...###...#..##..#...#
.##....######.#.##....#.#.#...#....###...##.##.#.#..##.#....#.##.###.#.####..##...###.#..#.....#.###
...#.####......#.##...#...####......#..#######.#.#.##..##....####.##....##.##..#.##..###...####.#.#.
####..####..##..#...#.#.....#..#..#.......#.##.#.....#.#.##.#..#####...##.#....##........#.........#
.#.#.#......##..#.###.##....#.#..######.##.#.#..#...#...#....###.....###.###....##.#.##..#.#..##.#.#
.##..###....#.#.#.#..#...##.#.##..#.#.##..#.#####.#...#..#...#####.###..##..#.....#.##..##.####.#.#.
..#..##.####....##.##.#...##.##.#..##.###.#..#.###...#...##.#.##.##.#.#..##.##.##..#.....#..####.##.
.#..#..#.#.#.###...###.##.##..##..##....##...#####.#.#...###.##.#.#....##.#..#...#.#..##...#.####...
#####......##....#.##..##.##..#..#.##..#.##.#.######..##..##...#..#.#..#.###..####.#.###..#.#..###.#
.####..#....#.##....#.##.#...#.###..###...##.##.##.#..#..##..#.....#.#########..#...#..####.##....##
####.###..##.#.#.##.#.####.###.###.#...#####.....#.#....#..####.#.#...####.##....#..##.#....#.#.###.
##.##...##...#.#####..#...#.#.##.#.##.#....#..#..####.#.#####.#...#...#..##.##.###..###.#....####..#
.##.####..###..#.####.#.....###....#...#..#...###.....#.####.#....##.####..#.###..#.###...#....##...
#....#...###.#...#.##.#.....#.##.###.....#.##...#...##.##...###.##...##..#####...#....#....#..###.#.
#.#...##.#.#..##..##..###..##...####.#.#..##..##.##..##.#.###.##...###.#.##.##.##..##..###..###..#.#
.##..###...#.####..#####.#.###....###.#..##..####.##..#.##.....###...#...#..##.###.#.#######.....#..
.####....##..##......##.#......#.##..##.##.###..###.......###....####.#.##..#.####..##.#.#.#.##.#..#
##...#####.#.....##..###...###.#...##..#####.#..###...#####..###......#...#.###.##..##...#.###...###
..###.#...###..#.##.##.##.#.##.....##.###..##..##.##..###....###..#.......###.##...##....#..##..##.#
#..#...##.###.#...#.##...#.##.###.##...##.#...##.#.#.#..#....###.#.......#.##.#..###.#.##.##..####.#
##...####.......#..##.#.#.#..#.##....#.##.##.#.####..##....###.####.#.###..#.##..##......#.#.#..####
###...#..##.#.......##..#.#...##...#...##..##.#.#..#.#.#.####.##.##.###..#.##.####..####....####.#..
#..###.##.....###..##.##.###.###.#.#....##.#######....#####.##.#....###.##..#...#..#.##.#.#.#.#..#..
.#.....#..###..##.#..##.##.###.##..#....###...##........#....####..#.##########...#....###.#...##.##
#.....#.#.#####.#.######.#....##..#...#.##.#..##..#####...######.#.####...#.####.###..#.##....##...#
.#.#...#.#..#.##.#..####..#..#.....##.#....#.#######.#.#..#.#.#.#.###...##..####..##.##.##..#.###...
.#..#.##.#..##.#.##....##..###..#........#.##.#.##.#..##.#.###.#.#..#...#..####.##...#.....#.###...#
..#....##..#..#.##.##.#..###......#.#..#.####..##.#.######..#######..##.##.#..##....#.##.....#.###..
.#....#..#....#...#.###...#.#...##..#..##.######..#..###.##..###.#.##...#.#..#.###.#..###.##...#..#.
##...##.####.##..####.#.#....#....#.###.##.###.##.##..#.#.#.....##...#.#..#####.##..#.#.....#.#.####
.....#.#.##..######....#...#.##..#...#..#...#.##..##..##.....#...##..#.#.####......#.#.##..#.#.#..#.
#.##...##.##..###..#....#...####..##....#.#....#..#.#.....######.....##....#..###.......##......#.#.
#.##.....##.#.#...#.#######.###..#..#...##...#.#.####.#########...#..#....#.....##.#.#.###.##..#.#..
.#.......#.##.....#####.#..#...###.##...#.#..#.###.#.#.#.#########.##.###...####...##.##...###.#.#.#
"""

struct Point: Equatable & Hashable {
    let x, y: Int
    
    func window() -> [Point] {
        return [
            Point(x: x-1, y: y-1),
            Point(x: x, y: y-1),
            Point(x: x+1, y: y-1),
            Point(x: x-1, y: y),
            Point(x: x, y: y),
            Point(x: x+1, y: y),
            Point(x: x-1, y: y+1),
            Point(x: x, y: y+1),
            Point(x: x+1, y: y+1)
        ]
    }
}

func binToInt(_ bin: [Int]) -> Int {
    return bin.reduce(0) { (result, next) in
        result * 2 + next
    }
}

struct Data {
    let lookup: [Int]
    var image: [Point:Int]
    var defaultPixel = 0
    
    init(input: String) {
        let components = input.components(separatedBy: "\n\n")
        lookup = components[0].split(separator: "\n").joined().map { $0 == "." ? 0 : 1 }
        image = Dictionary(
            uniqueKeysWithValues: components[1].components(separatedBy: "\n")
                .enumerated()
                .flatMap { (y, line) in
                    line.enumerated().map { (x, char) in
                        (Point(x: x, y: y), char == "." ? 0 : 1)
                    }
                }
        )
    }
    
    mutating func enhance() {
        let minX = image.keys.map { $0.x }.min()! - 1
        let maxX = image.keys.map { $0.x }.max()! + 1
        let minY = image.keys.map { $0.y }.min()! - 1
        let maxY = image.keys.map { $0.y }.max()! + 1
        
        var newImage = Dictionary<Point,Int>()
        for y in minY...maxY {
            for x in minX...maxX {
                let index = binToInt(
                    Point(x: x, y: y).window().map {
                        image[$0, default: defaultPixel]
                    }
                )
                newImage[Point(x: x, y: y)] = lookup[index]
            }
        }
        image = newImage
        defaultPixel = 1 - defaultPixel
    }
    
    func display() {
        let minX = image.keys.map { $0.x }.min()!
        let maxX = image.keys.map { $0.x }.max()!
        let minY = image.keys.map { $0.y }.min()!
        let maxY = image.keys.map { $0.y }.max()!
        print()
        print(minX, minY, maxX, maxY)
        
        for y in minY...maxY {
            for x in minX...maxX {
                print(image[Point(x: x, y: y), default: defaultPixel] == 1 ? "#" : ".", terminator: "")
            }
            print()
        }
    }
}

var image = Data(input: data)
image.display()
for _ in 0 ..< 50 {
    image.enhance()
    image.display()
}
print(image.image.values.filter { $0 == 1 }.count)
