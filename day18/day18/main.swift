//
//  main.swift
//  day18
//
//  Created by Jerry Hsu on 12/18/21.
//

import Foundation

enum ElementType {
    case regular, pair
}

class Element: CustomDebugStringConvertible {
    init(value: Int) {
        self.type = .regular
        self.value = value
        self.index = Int.max
    }
    
    init(node: Node) {
        self.type = .pair
        self.node = node
        self.index = Int.max
    }
    
    var type: ElementType
    var value: Int!
    var index: Int = 0
    var node: Node!
    
    var magnitude: Int {
        switch type {
            case .regular:
                return value
            case .pair:
                return node.magnitude
        }
    }
    
    
    
    var debugDescription: String {
        switch type {
            case .pair:
                return "\(node!)"
//                return "\(node.level):\(node!)"
            case .regular:
                return "\(value!)"
//                return "\(value!)(\(index))"
        }
    }
}
class Node: CustomDebugStringConvertible {
    
    var debugDescription: String {
        return "[\(left),\(right)]"
    }
    
    convenience init(input: String) {
        let node = Node.parse(input: input)
        self.init(left: node.left, right: node.right)
    }
    
    init(left: Element, right: Element) {
        self.left = left
        self.right = right
        indexElements()
        reduce()
    }
    
    init(fromValue value: Int) {
        left = Element(value: value / 2)
        right = Element(value: value / 2 + value % 2)
    }
    
    var left: Element
    var right: Element
    var level: Int = 0
    
    var magnitude: Int {
        left.magnitude * 3 + right.magnitude * 2
    }
    
    // returns next index to be used
    @discardableResult
    func indexElements(index: Int = 0, level: Int = 0) -> Int {
        self.level = level
        var nextIndex = index
        switch left.type {
            case .regular:
                left.index = nextIndex
                nextIndex += 1
            case .pair:
                nextIndex = left.node.indexElements(index: nextIndex, level: level + 1)
        }
        switch right.type {
            case .regular:
                right.index = nextIndex
                nextIndex += 1
            case .pair:
                nextIndex = right.node.indexElements(index: nextIndex, level: level + 1)
        }
        return nextIndex
    }
    
    static func parse(input: String) -> (left: Element, right: Element, remainder: String) {
        var remainder = String(input.dropFirst())
        let left: Element
        let right: Element
        if remainder.first == "[" {
            let node = parse(input: remainder)
            left = Element(node: Node(left: node.left, right: node.right))
            remainder = node.remainder
        } else {
            let number = remainder.removeFirst()
            left = Element(value: Int(String(number))!)
        }
        guard remainder.removeFirst() == "," else {
            fatalError("second element of node was not separated by comma")
        }
        if remainder.first == "[" {
            let node = parse(input: remainder)
            right = Element(node: Node(left: node.left, right: node.right))
            remainder = node.remainder
        } else {
            let number = remainder.removeFirst()
            right = Element(value: Int(String(number))!)
        }
        guard remainder.removeFirst() == "]" else {
            fatalError("second element of node was not terminated by ]")
        }
        return (left, right, remainder)
    }
    
    func findExplodableNode() -> Node? {
        if level == 4 {
            return self
        }
        switch left.type {
            case .pair:
                if left.node.level == 4 {
                    let node = left.node
                    left = Element(value: 0)
                    return node
                } else if let node = left.node.findExplodableNode() {
                    return node
                }
            case .regular:
                break
        }
        switch right.type {
            case .pair:
                if right.node.level == 4 {
                    let node = right.node
                    right = Element(value: 0)
                    return node
                } else if let node = right.node.findExplodableNode() {
                    return node
                }
            case .regular:
                break

        }
        return nil
    }
    
    func findSplitableValue() -> Bool {
        switch left.type {
            case .regular:
                if left.value > 9 {
                    left = Element(node: Node(fromValue: left.value))
                    return true
                }
            case .pair:
                if left.node.findSplitableValue() {
                    return true
                }
        }
        switch right.type {
            case .regular:
                if right.value > 9 {
                    right = Element(node: Node(fromValue: right.value))
                    return true
                }
            case .pair:
                if right.node.findSplitableValue() {
                    return true
                }
        }
        return false
    }
    
    func incrementValue(withIndex index: Int, by amount: Int) {
        switch left.type {
            case .regular:
                if left.index == index {
                    left.value += amount
                }
            case .pair:
                left.node.incrementValue(withIndex: index, by: amount)
        }
        switch right.type {
            case .regular:
                if right.index == index {
                    right.value += amount
                }
            case .pair:
                right.node.incrementValue(withIndex: index, by: amount)
        }
    }
    
    func reduce() {
        var changes = true
        while changes {
            if let explodableNode = findExplodableNode() {
                incrementValue(withIndex: explodableNode.left.index - 1, by: explodableNode.left.value)
                incrementValue(withIndex: explodableNode.right.index + 1, by: explodableNode.right.value)
                indexElements()
            } else if findSplitableValue() {
                indexElements()
            } else {
                changes = false
            }
        }
    }
    
    static func +(lhs: Node, rhs: Node) -> Node {
        return Node(left: Element(node: lhs), right: Element(node: rhs))
    }
}

let sample1 = """
[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
[7,[5,[[3,8],[1,4]]]]
[[2,[2,2]],[8,[8,1]]]
[2,9]
[1,[[[9,3],9],[[9,0],[0,7]]]]
[[[5,[7,4]],7],1]
[[[[4,2],2],6],[8,7]]
"""

let sample2 = """
[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
[[[5,[2,8]],4],[5,[[9,9],0]]]
[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
[[[[5,4],[7,7]],8],[[8,3],8]]
[[9,3],[[9,9],[6,[4,9]]]]
[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]
"""

let data = """
[[8,8],5]
[[[[9,0],1],4],[[3,6],[0,5]]]
[[9,[0,[4,5]]],[1,[[6,8],4]]]
[[8,7],[[[8,5],[2,0]],[[6,3],[5,0]]]]
[[[1,8],2],[[[9,1],[2,0]],[1,[9,4]]]]
[[[6,[8,8]],[6,4]],[[8,2],[[0,8],9]]]
[[[6,3],[9,[9,1]]],[[0,0],1]]
[[[[2,7],[8,2]],[[9,6],[5,1]]],[[[7,6],[6,0]],[4,2]]]
[[[8,[9,1]],[9,3]],[[[5,4],[8,0]],[[3,5],[9,5]]]]
[[[3,[4,9]],2],[[7,9],7]]
[[[7,[9,0]],5],[[[3,4],[2,6]],[[3,5],[7,2]]]]
[[8,[8,9]],[[[3,2],[6,2]],4]]
[[[[8,0],3],[3,8]],[[[5,0],[7,3]],[5,[3,0]]]]
[4,[[3,[0,9]],[[5,0],[2,0]]]]
[[[[0,1],5],[3,[9,6]]],[[[4,4],5],[[3,8],[5,1]]]]
[[[[4,8],8],0],[5,[[1,7],[4,3]]]]
[[3,[[1,1],[5,6]]],[7,[[4,0],[0,7]]]]
[9,[4,[[1,3],2]]]
[[[1,[2,7]],[[4,7],3]],[2,1]]
[[[9,5],[2,5]],[[[8,9],[4,5]],2]]
[[2,[[7,4],6]],[[1,[0,7]],[[4,8],8]]]
[[[[0,5],3],[7,0]],9]
[[[[1,4],[4,3]],7],[[9,4],[6,[8,6]]]]
[[[7,2],[[3,3],1]],[5,9]]
[[[9,[6,2]],2],[[6,5],6]]
[[5,[3,2]],[[[2,4],[1,5]],[6,3]]]
[6,3]
[[9,6],[[[8,2],[5,6]],[[3,5],[3,3]]]]
[[[[2,5],7],4],[8,3]]
[[[[6,1],9],[0,6]],[6,2]]
[[[[8,4],2],[[0,1],[5,8]]],9]
[[[7,0],[4,9]],[[[9,9],[4,4]],[6,6]]]
[[[9,8],[2,0]],[[9,[6,2]],[6,[5,6]]]]
[[[9,8],[[0,6],[3,5]]],[[[4,7],[7,5]],[7,[8,5]]]]
[[[[9,0],[1,6]],[2,[5,3]]],[[[2,0],[0,3]],[[9,1],[7,7]]]]
[[[5,[2,2]],[2,[1,0]]],[1,1]]
[[[9,[7,2]],[[2,7],1]],[[5,7],[[8,7],7]]]
[[[9,[9,4]],[[0,8],2]],[0,[[2,2],[4,1]]]]
[[[5,5],[9,[2,0]]],[[[9,0],6],1]]
[[[1,9],[[9,5],[5,6]]],[6,[5,[9,4]]]]
[[[[8,6],9],9],[[7,2],[7,[2,6]]]]
[[[[6,4],7],7],[[2,[9,7]],7]]
[[7,[[5,6],9]],[[[9,8],8],[[8,9],[1,0]]]]
[[[0,[7,6]],0],[[[2,5],1],9]]
[[[3,[4,1]],[4,2]],[0,[[6,0],[1,6]]]]
[[9,[0,0]],[[[3,0],[9,9]],[1,[1,5]]]]
[[[[9,9],1],6],[5,6]]
[3,4]
[[[[5,4],9],6],2]
[[5,4],[[6,[7,4]],[[0,3],0]]]
[[[3,[9,6]],4],[[[9,8],6],3]]
[[5,[1,[5,5]]],[[[3,8],[0,1]],[[9,3],[6,2]]]]
[[4,[0,3]],1]
[[[7,[2,9]],[[5,8],2]],[[[4,4],[2,0]],8]]
[[[[4,0],0],8],7]
[[[[3,0],0],[[6,0],3]],[[[1,5],1],[3,[0,0]]]]
[[[[8,1],5],0],[[[3,9],[8,3]],[[6,9],[5,1]]]]
[[7,7],[[[8,5],2],[9,2]]]
[[[[4,9],9],[6,[5,3]]],[[[7,1],[7,1]],[[9,5],[7,0]]]]
[[7,[0,5]],[7,[2,[1,6]]]]
[[9,[0,[0,2]]],[[1,1],[[6,6],[5,3]]]]
[[[2,9],[[6,9],9]],[[[4,2],7],[1,[2,3]]]]
[[[0,1],[3,3]],[3,[[2,7],2]]]
[[[5,6],8],[[[4,9],[3,3]],[6,[5,2]]]]
[[4,[4,[2,5]]],[[2,[4,8]],[3,[7,7]]]]
[[2,5],[[[9,6],[9,3]],[[4,5],[2,3]]]]
[[5,[0,5]],[[[2,1],[0,5]],3]]
[[[[2,0],5],[[7,9],[4,5]]],[0,[[1,4],9]]]
[[[[1,3],2],[[3,9],[9,5]]],[[[4,1],[3,8]],0]]
[[[[1,8],[8,3]],[3,0]],[[5,1],[4,8]]]
[[1,6],[3,2]]
[[4,5],[[[9,3],[8,6]],[2,[8,6]]]]
[[[[4,4],1],[[7,3],2]],[[9,[2,1]],[8,2]]]
[0,[[2,[3,8]],9]]
[[1,[5,0]],[0,[[2,6],[8,5]]]]
[[6,[6,1]],[[2,[7,9]],[[8,3],1]]]
[[[2,[5,9]],[[8,9],1]],[[[5,2],2],4]]
[[[4,3],5],[[6,[3,6]],5]]
[1,[6,[6,2]]]
[[[[4,9],3],9],[[3,9],[8,[4,9]]]]
[[[[7,1],[1,6]],[[7,8],[3,7]]],[[[5,3],7],[9,[3,1]]]]
[[[[0,8],[8,9]],2],7]
[[[[3,7],[9,8]],[[7,1],8]],[[4,[4,6]],8]]
[3,[3,[[4,4],5]]]
[[3,[[2,3],7]],[[7,9],2]]
[[[[0,6],[5,1]],[[7,2],5]],[9,8]]
[[4,0],[[4,3],[7,2]]]
[[[8,[1,1]],[7,[9,1]]],[9,[9,[0,8]]]]
[9,[[[4,5],8],[[3,4],9]]]
[[[6,[4,7]],[8,7]],[[[3,8],5],[[2,1],[3,5]]]]
[[[[5,5],[6,8]],[[2,3],6]],[8,[5,7]]]
[[5,[[6,1],[3,6]]],[[[0,6],[7,1]],[9,[8,4]]]]
[[[[0,1],[4,9]],[[1,7],[3,3]]],[6,[3,[6,1]]]]
[[[[3,8],5],[[4,7],2]],2]
[[6,[[4,4],0]],[[2,[4,5]],[8,2]]]
[[6,[9,[7,0]]],[[9,[1,6]],[[6,1],1]]]
[[[[2,1],[5,7]],[5,[9,3]]],[[[7,9],[4,2]],4]]
[[3,1],[[7,8],[[8,8],9]]]
[[[[9,4],[1,8]],[9,[3,7]]],[[6,9],[[7,2],1]]]
[[[9,3],2],9]
"""

func add(input: String) -> Node {
    var lines = input.components(separatedBy: "\n")
    let firstLine = Node(input: lines.removeFirst())
    return lines.reduce(firstLine) { partialResult, nextLine in
        return partialResult + Node(input: nextLine)
    }
}

func largestSum(input: String) {
    let nodes = input.components(separatedBy: "\n")
    var largestMagnitude = 0
    for (index, node1) in nodes[0..<(nodes.count - 1)].enumerated() {
        for node2 in nodes[(index + 1)..<(nodes.count)] {
            let sum = Node(input: node1) + Node(input: node2)
            if largestMagnitude < sum.magnitude {
                largestMagnitude = sum.magnitude
                print("\(node1) + \(node2) = \(sum) = \(largestMagnitude)")
            }
            let sum2 = Node(input: node2) + Node(input: node1)
            if largestMagnitude < sum2.magnitude {
                largestMagnitude = sum2.magnitude
                print("\(node2) + \(node1) = \(sum2) = \(largestMagnitude)")
            }
        }
    }
    print(largestMagnitude)
}

//print(add(input: sample1).magnitude)
//print(add(input: sample2).magnitude)
//print(add(input: data).magnitude)
//print(Node(input: "[[[[[1,1],[2,2]],[3,3]],[4,4]],[5,5]]"))
//largestSum(input: sample2)
largestSum(input: data)
