//
//  main.swift
//  day12
//
//  Created by Jerry Hsu on 12/12/21.
//

import Foundation

let sample = """
start-A
start-b
A-c
A-b
b-d
A-end
b-end
"""

let sample2 = """
fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW
"""

let data = """
start-YA
ps-yq
zt-mu
JS-yi
yq-VJ
QT-ps
start-yq
YA-yi
start-nf
nf-YA
nf-JS
JS-ez
yq-JS
ps-JS
ps-yi
yq-nf
QT-yi
end-QT
nf-yi
zt-QT
end-ez
yq-YA
end-JS
"""

class Node: Equatable, Hashable, CustomDebugStringConvertible {
    var debugDescription: String {
        description
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.name == rhs.name
    }
    
    let name: String
    let big: Bool
    var links = Set<Node>()
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(name)
    }
    
    init(name: String) {
        self.name = name
        self.big = name.allSatisfy({ $0.isUppercase }) || name == "start"
    }
    
    var description: String {
        "\(name):\(big ? "1" : "0")"
    }
}

func parse(input: String) -> [String:Node] {
    var result: [String:Node] = [:]
    let lines = input.split(separator: "\n")
    for line in lines {
        let components = line.components(separatedBy: "-")
        let node1 = result[components[0], default: Node(name: components[0])]
        let node2 = result[components[1], default: Node(name: components[1])]
        node1.links.insert(node2)
        node2.links.insert(node1)
        result[node1.name] = node1
        result[node2.name] = node2
    }
    return result
}

struct Candidate: Equatable, Hashable {
    var nodes: [Node]
    var eligibleNodes: Set<Node>
    
    var smallNodesVisited: Array<Node> {
        nodes.filter { !$0.big }
    }
    
    func visitedSmallTwice(including newNode: Node) -> Bool {
        var nodeSeen: Set<Node> = [newNode]
        for node in smallNodesVisited {
            if nodeSeen.contains(node) {
                return true
            } else {
                nodeSeen.insert(node)
            }
        }
        return false
    }
    
    init(map: [String:Node]) {
        nodes = [map["start"]!]
        eligibleNodes = Set(map.values.filter { $0.name != "start" })
    }
    
    func crawl() -> [Candidate] {
        let current = nodes.last!
        if current.name == "end" {
            return [self]
        }
        let nextNodes = current.links.intersection(eligibleNodes)
        return nextNodes.map { (newNode) in
            var newCandidate = self
            newCandidate.nodes.append(newNode)
            if !newNode.big {
                newCandidate.eligibleNodes.remove(newNode)
            }
            return newCandidate
        }
    }

    func crawl2() -> [Candidate] {
        let current = nodes.last!
        if current.name == "end" {
            return [self]
        }
        let nextNodes = current.links.intersection(eligibleNodes)
        return nextNodes.map { (newNode) in
            var newCandidate = self
            newCandidate.nodes.append(newNode)
            if !newNode.big && visitedSmallTwice(including: newNode) {
                if visitedSmallTwice(including: newNode) {
                    newCandidate.eligibleNodes.subtract(smallNodesVisited)
                }
                newCandidate.eligibleNodes.remove(newNode)
            }
            return newCandidate
        }
    }

    func display() -> String {
        return nodes.map { $0.name }.joined(separator: ",")
    }
}

func crawl(map: [String:Node]) {
    var paths: [Candidate] = [Candidate(map: map)]

    var lastCandidates: [Candidate] = []
    while lastCandidates != paths {
        lastCandidates = paths
        paths = paths.flatMap { $0.crawl2() }
    }
    let displayPaths = paths.map { $0.display() }.sorted()
    for path in displayPaths {
        print(path)
    }
    
    print(paths.count)
}

//crawl(map: parse(input: sample))
//crawl(map: parse(input: sample2))
crawl(map: parse(input: data))
