//
//  main.swift
//  day14
//
//  Created by Jerry Hsu on 12/14/21.
//

import Foundation

let sample = """
NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C
"""

let data = """
SHHNCOPHONHFBVNKCFFC

HH -> K
PS -> P
BV -> H
HB -> H
CK -> F
FN -> B
PV -> S
KK -> F
OF -> C
SF -> B
KB -> S
HO -> O
NH -> N
ON -> V
VF -> K
VP -> K
PH -> K
FF -> V
OV -> N
BO -> K
PO -> S
CH -> N
FO -> V
FB -> H
FV -> N
FK -> S
VC -> V
CP -> K
CO -> K
SV -> N
PP -> B
BS -> P
VS -> C
HV -> H
NN -> F
NK -> C
PC -> V
HS -> S
FS -> S
OB -> S
VV -> N
VO -> P
KV -> F
SK -> O
BC -> P
BP -> F
NS -> P
SN -> S
NC -> N
FC -> V
CN -> S
OK -> B
SC -> N
HN -> B
HP -> B
KP -> B
CB -> K
KF -> C
OS -> B
BH -> O
PN -> K
VN -> O
KH -> F
BF -> H
HF -> K
HC -> P
NP -> H
KO -> K
CF -> H
BK -> O
OH -> P
SO -> F
BB -> F
VB -> K
SP -> O
SH -> O
PK -> O
HK -> P
CC -> V
NB -> O
NV -> F
OO -> F
VK -> V
FH -> H
SS -> C
NO -> P
CS -> H
BN -> V
FP -> N
OP -> N
PB -> P
OC -> O
SB -> V
VH -> O
KS -> B
PF -> N
KN -> H
NF -> N
CV -> K
KC -> B
"""

struct Rule {
    let name: String
    let children: [String]
}

struct Mixer {
    var template: String
    var rules: [String:[String]]
    var counts: [String:Int] = [:]
    let lastChar: Character
    
    init(input: String) {
        let parts = input.components(separatedBy: "\n\n")
        template = parts[0]
        lastChar = template.last!
        rules = Dictionary(uniqueKeysWithValues:
                            parts[1].split(separator: "\n")
                            .map { line in
            let components = line.components(separatedBy: " -> ")
            let children = [
                "\(components[0].first!)\(components[1])",
                "\(components[1])\(components[0].last!)"
            ]
            return (components[0], children)
        })
        for (first, second) in zip(template, template.dropFirst()) {
            counts["\(first)\(second)", default: 0] += 1
        }
    }
    
    mutating func step() {
        var newCounts: [String:Int] = [:]
        for (key, value) in counts {
            guard let children = rules[key] else {
                fatalError("Could not find lookup key")
            }
            newCounts[children[0], default: 0] += value
            newCounts[children[1], default: 0] += value
        }
        counts = newCounts
    }
    
    func count() {
        var charCounts: [Character:Int] = [:]
        for (key, value) in counts {
            charCounts[key.first!, default: 0] += value
        }
        charCounts[lastChar, default: 0] += 1
        print(charCounts)
        print(charCounts.values.max()! - charCounts.values.min()!)
    }
}

var mixer = Mixer(input: data)
for _ in 0..<40 {
    mixer.step()
}
mixer.count()
