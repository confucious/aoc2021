//
//  main.swift
//  day16
//
//  Created by Jerry Hsu on 12/16/21.
//

import Foundation

let sample = """
"""

let data = """
020D78804D397973DB5B934D9280CC9F43080286957D9F60923592619D3230047C0109763976295356007365B37539ADE687F333EA8469200B666F5DC84E80232FC2C91B8490041332EB4006C4759775933530052C0119FAA7CB6ED57B9BBFBDC153004B0024299B490E537AFE3DA069EC507800370980F96F924A4F1E0495F691259198031C95AEF587B85B254F49C27AA2640082490F4B0F9802B2CFDA0094D5FB5D626E32B16D300565398DC6AFF600A080371BA12C1900042A37C398490F67BDDB131802928F5A009080351DA1FC441006A3C46C82020084FC1BE07CEA298029A008CCF08E5ED4689FD73BAA4510C009981C20056E2E4FAACA36000A10600D45A8750CC8010989716A299002171E634439200B47001009C749C7591BD7D0431002A4A73029866200F1277D7D8570043123A976AD72FFBD9CC80501A00AE677F5A43D8DB54D5FDECB7C8DEB0C77F8683005FC0109FCE7C89252E72693370545007A29C5B832E017CFF3E6B262126E7298FA1CC4A072E0054F5FBECC06671FE7D2C802359B56A0040245924585400F40313580B9B10031C00A500354009100300081D50028C00C1002C005BA300204008200FB50033F70028001FE60053A7E93957E1D09940209B7195A56BCC75AE7F18D46E273882402CCD006A600084C1D8ED0E8401D8A90BE12CCF2F4C4ADA602013BC401B8C11360880021B1361E4511007609C7B8CA8002DC32200F3AC01698EE2FF8A2C95B42F2DBAEB48A401BC5802737F8460C537F8460CF3D953100625C5A7D766E9CB7A39D8820082F29A9C9C244D6529C589F8C693EA5CD0218043382126492AD732924022CE006AE200DC248471D00010986D17A3547F200CA340149EDC4F67B71399BAEF2A64024B78028200FC778311CC40188AF0DA194CF743CC014E4D5A5AFBB4A4F30C9AC435004E662BB3EF0
"""

struct Packet: CustomDebugStringConvertible {
    
    var debugDescription: String {
        "V: \(version) T: \(type)"
    }
    
    let bits: [Int]
    
    init(input: String) {
        self.init(
            bits: input.uppercased().flatMap { (char) -> [Int] in
                switch char {
                    case "0": return [0, 0, 0, 0]
                    case "1": return [0, 0, 0, 1]
                    case "2": return [0, 0, 1, 0]
                    case "3": return [0, 0, 1, 1]
                    case "4": return [0, 1, 0, 0]
                    case "5": return [0, 1, 0, 1]
                    case "6": return [0, 1, 1, 0]
                    case "7": return [0, 1, 1, 1]
                    case "8": return [1, 0, 0, 0]
                    case "9": return [1, 0, 0, 1]
                    case "A": return [1, 0, 1, 0]
                    case "B": return [1, 0, 1, 1]
                    case "C": return [1, 1, 0, 0]
                    case "D": return [1, 1, 0, 1]
                    case "E": return [1, 1, 1, 0]
                    case "F": return [1, 1, 1, 1]
                    default:
                        fatalError("illegal character \(char)")
                }
            })
    }
    
    let version: Int
    let type: Int
    
    init(bits: [Int]) {
        self.bits = bits
        self.version = bits.packBits(start: 0, length: 3)
        self.type = bits.packBits(start: 3, length: 3)
    }
        
    enum PayloadLength {
        case totalBits(Int)
        case totalPackets(Int)
    }
    
    var payloadLength: PayloadLength {
        guard type != 4 else {
            fatalError("Cannot get payload length for type 4")
        }

        switch bits[6] {
            case 0:
                return .totalBits(bits.packBits(start: 7, length: 15))
            case 1:
                return .totalPackets(bits.packBits(start: 7, length: 11))
            default:
                fatalError("Invalid value in payload length")
        }
    }
    
    var remainder: [Int] {
        switch type {
            case 4:
                return literalValue.remainder
            default:
                return subpackets.remainder
        }
    }
    
    var literalValue: (value: Int, remainder: [Int]) {
        guard type == 4 else {
            fatalError("Cannot get literalValue unless type = 4")
        }
        var done = false
        var bits = Array(self.bits[6...])
        var result = 0
        while !done {
            done = bits[0] == 0
            let value = bits.packBits(start: 1, length: 4)
            result = result * 16 + value
            bits = Array(bits[5...])
        }
        return (result, bits)
    }
    
    var subpackets: (packets: [Packet], remainder: [Int]) {
        if type == 4 {
            return ([], [])
        }
        switch payloadLength {
            case .totalBits(let totalBits):
                var subBits = Array(bits[22..<(22+totalBits)])
                let remainder = Array(bits[(22+totalBits)...])
                var subPackets: [Packet] = []
                while !subBits.isEmpty {
                    let packet = Packet(bits: subBits)
                    subPackets.append(packet)
                    subBits = packet.remainder
                }
                return (subPackets, remainder)
            case .totalPackets(let totalPackets):
                var subBits = Array(bits[18...])
                var subPackets: [Packet] = []
                for _ in 0..<totalPackets {
                    let packet = Packet(bits: subBits)
                    subPackets.append(packet)
                    subBits = packet.remainder
                }
                return (subPackets, subBits)
        }
        
    }
    
    var versionSum: Int {
//        print("version \(version)")
        return version + subpackets.packets.map { $0.versionSum }.reduce(0, +)
    }
    
    var value: Int {
        switch type {
            case 0:
                return subpackets.packets.map { $0.value }.reduce(0, +)
            case 1:
                return subpackets.packets.map { $0.value }.reduce(1, *)
            case 2:
                return subpackets.packets.map { $0.value }.min()!
            case 3:
                return subpackets.packets.map { $0.value }.max()!
            case 4:
                return literalValue.value
            case 5:
                return subpackets.packets[0].value > subpackets.packets[1].value ? 1 : 0
            case 6:
                return subpackets.packets[0].value < subpackets.packets[1].value ? 1 : 0
            case 7:
                return subpackets.packets[0].value == subpackets.packets[1].value ? 1 : 0
            default:
                fatalError("Unknown type")
        }
    }
}

extension Array where Element == Int {
    func packBits(start index: Int = 0, length: Int? = nil) -> Int {
        if let length = length {
            let endIndex = index + length
            return self[index ..<  endIndex].reduce(0) { partialResult, value in
                partialResult * 2 + value
            }
        } else {
            return self[index...].reduce(0) { partialResult, value in
                partialResult * 2 + value
            }
        }
    }
}

//print(Packet(input: "D2FE28").versionSum)
//print(Packet(input: "D2FE28").literalValue)
//print(Packet(input: "38006F45291200").versionSum)
//print(Packet(input: "8A004A801A8002F478").versionSum)
//print(Packet(input: "620080001611562C8802118E34").versionSum)
//print(Packet(input: "C0015000016115A2E0802F182340").versionSum)
//print(Packet(input: "A0016C880162017C3686B18A3D4780").versionSum)
//print(Packet(input: data).versionSum)
print(Packet(input: "C200B40A82").value)
print(Packet(input: "04005AC33890").value)
print(Packet(input: "880086C3E88112").value)
print(Packet(input: "CE00C43D881120").value)
print(Packet(input: data).value)
