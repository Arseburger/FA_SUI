import Foundation

struct Matches: Codable {
    var played: HAT<Int>
    var wins: HAT<Int>
    var draws: HAT<Int>
    var loses: HAT<Int>
}

struct Goals: Codable {
    var _for: Goal
    var against: Goal
}

struct Goal: Codable {
    var total: HAT<Int>
    var average: HAT<String>
}
