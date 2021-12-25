//
//  main.swift
//  day24
//
//  Created by Jerry Hsu on 12/24/21.
//

import Foundation

enum Instruction {
    case inp(Register)
    case add(Register, Operand)
    case mul(Register, Operand)
    case div(Register, Operand)
    case mod(Register, Operand)
    case eql(Register, Operand)
}

enum Register: String {
    case w, x, y, z
}

enum Operand {
    case register(Register)
    case direct(Int)
    
    init(input: String) {
        if let register = Register(rawValue: input) {
            self = .register(register)
        } else {
            self = .direct(Int(input)!)
        }
    }
}



let sample1 = """
inp x
mul x -1
"""

let sample2 = """
inp z
inp x
mul z 3
eql z x
"""

let sample3 = """
inp w
add z w
mod z 2
div w 2
add y w
mod y 2
div w 2
add x w
mod x 2
div w 2
mod w 2
"""

let data1 = """
inp w
mul x 0
add x z
mod x 26
div z 1
add x 12
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 4
mul y x
add z y
"""
let data2 = """
inp w
mul x 0
add x z
mod x 26
div z 1
add x 11
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 11
mul y x
add z y
"""
let data3 = """
inp w
mul x 0
add x z
mod x 26
div z 1
add x 13
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 5
mul y x
add z y
"""
let data4 = """
inp w
mul x 0
add x z
mod x 26
div z 1
add x 11
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 11
mul y x
add z y
"""
let data5 = """
inp w
mul x 0
add x z
mod x 26
div z 1
add x 14
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 14
mul y x
add z y
"""
let data6 = """
inp w
mul x 0
add x z
mod x 26
div z 26
add x -10
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 7
mul y x
add z y
"""
let data7 = """
inp w
mul x 0
add x z
mod x 26
div z 1
add x 11
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 11
mul y x
add z y
"""
let data8 = """
inp w
mul x 0
add x z
mod x 26
div z 26
add x -9
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 4
mul y x
add z y
"""
let data9 = """
inp w
mul x 0
add x z
mod x 26
div z 26
add x -3
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 6
mul y x
add z y
"""
let data10 = """
inp w
mul x 0
add x z
mod x 26
div z 1
add x 13
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 5
mul y x
add z y
"""
let data11 = """
inp w
mul x 0
add x z
mod x 26
div z 26
add x -5
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 9
mul y x
add z y
"""
let data12 = """
inp w
mul x 0
add x z
mod x 26
div z 26
add x -10
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 12
mul y x
add z y
"""
let data13 = """
inp w
mul x 0
add x z
mod x 26
div z 26
add x -4
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 14
mul y x
add z y
"""
let data14 = """
inp w
mul x 0
add x z
mod x 26
div z 26
add x -5
eql x w
eql x 0
mul y 0
add y 25
mul y x
add y 1
mul z y
mul y 0
add y w
add y 14
mul y x
add z y
"""

struct Alu {
    let instructions: [Instruction]
    
    init(input: String) {
        instructions = input.components(separatedBy: "\n")
            .map { (line) in
                let components = line.components(separatedBy: " ")
                switch components[0] {
                    case "inp":
                        return .inp(Register(rawValue: components[1])!)
                    case "add":
                        return .add(Register(rawValue: components[1])!, Operand(input: components[2]))
                    case "mul":
                        return .mul(Register(rawValue: components[1])!, Operand(input: components[2]))
                    case "div":
                        return .div(Register(rawValue: components[1])!, Operand(input: components[2]))
                    case "mod":
                        return .mod(Register(rawValue: components[1])!, Operand(input: components[2]))
                    case "eql":
                        return .eql(Register(rawValue: components[1])!, Operand(input: components[2]))
                    default:
                        fatalError("Unknown \(components)")
                }
            }
    }
    
    func run(inputs: [Int], initialRegisters: [Register:Int] = [:]) -> [Register:Int] {
        var registers = initialRegisters
        func read(_ register: Register) -> Int {
            return registers[register, default: 0]
        }
        
        func read(_ operand: Operand) -> Int {
            switch operand {
                case .register(let register):
                    return read(register)
                case .direct(let int):
                    return int
            }
        }
        
        var inputs = inputs
        instructions.forEach { (instruction) in
            switch instruction {
                case let .inp(register):
                    registers[register] = inputs.removeFirst()
                case let .add(register, operand):
                    registers[register] = read(register) + read(operand)
                case let .mul(register, operand):
                    registers[register] = read(register) * read(operand)
                case let .div(register, operand):
                    registers[register] = read(register) / read(operand)
                case let .mod(register, operand):
                    registers[register] = read(register) % read(operand)
                case let .eql(register, operand):
                    registers[register] = read(register) == read(operand) ? 1 : 0
            }
            print(read(.w), read(.x), read(.y), read(.z))
        }
        return registers
    }
}
//Alu(input: sample1).run(inputs: [20])
//Alu(input: sample2).run(inputs: [20, 60])
//Alu(input: sample3).run(inputs: [12])

let numbers = [9, 8, 7, 6, 5, 4, 3, 2, 1]

let monad = Alu(input: data1)
var indexes = [0,0,0,0,0,0,0,0,0,0,0,0,0,8]
func buildInput(indexes: [Int]) -> [Int] {
    return indexes.map { numbers[$0] }
}


func increment(indexes: [Int]) -> [Int] {
    var place = 13
    var value = 1
    var result = indexes
    while value != 0 && place >= 0 {
        result[place] += value
        if result[place] >= 9 {
            result[place] = 0
            place -= 1
        } else {
            value = 0
        }
    }
    return result
}

func search() {
    var done = false
    var count = 0
    var start = Date()
    while !done {
        count += 1
        if count % 100000 == 0 {
            print(count, Date().timeIntervalSince(start))
        }
        let input = buildInput(indexes: indexes)
        let results = monad.run(inputs: input)
        done = results[.z] == 0
        if done {
            print(input, results[.w, default: 0], results[.x, default: 0], results[.y, default: 0], results[.z, default: 0])
        }
        indexes = increment(indexes: indexes)
    }
}
//let test2 = Alu(input: data2)
//stride(from: 9, to: 0, by: -1).forEach {print(test2.run(inputs: [9], initialRegisters: [.z: $0+4]))}

//let test10 = Alu(input: data10)
//print(test10.run(inputs: [1], initialRegisters: [.z: 100]))
//let test13 = Alu(input: data13)
//stride(from: 9, to: 0, by: -1).forEach {print(test13.run(inputs: [$0], initialRegisters: [.z: 14*26+13]))}
//let test14 = Alu(input: data14)
//stride(from: 9, to: 0, by: -1).forEach {print(test14.run(inputs: [$0], initialRegisters: [.z: 14]))}

let test = Alu(input: [
    data1,
    data2,
    data3,
    data4,
    data5,
    data6,
    data7,
    data8,
    data9,
    data10,
    data11,
    data12,
    data13,
    data14
].joined(separator: "\n"))
print(test.run(
    inputs: [
        9,2,9,
        1,
             5,9,
             7,9,
             9,9,
             9,
        4,9,8
    ]))

// +a z1 = w1 + 4                  = w14 + 5    w1 = w14 + 1   9, 8
// +b z2 = w2 + 11 + z1 * 26       = w13 + 4    w2 = w13 - 7   2, 9
// +c z3 = w3 + 5 + z2 * 26        = w12 + 10   w3 = w12 + 5   9, 4
// +d z4 = w4 + 11 + z3 * 26        = w9 + 3     w4 = w9 - 8   1, 9
// +e z5 = w5 + 14 + z4 * 26        = w6 + 10    w5 = w6 - 4    5, 9
// -e z6 = z7 * 26 + w6 + 10
// +f z7 = w7 + 11 + z6 * 26        = w8 + 9     w7 = w8 - 2    7, 9
// -f z8 = z9 * 26 + w8 + 9
// -d z9 = z10 * 26 + w9 + 3
// +g z10 = w10 + 5 + z9 * 26       = w11 + 5    w10 = w11      9, 9
// -g z11 = z12 * 26 + w11 + 5    9
// -c z12 = z13 * 26 + w12 + 10
// -b z13 = z14 * 26 + w13 + 4
// -a z14 = w14 + 5                8
