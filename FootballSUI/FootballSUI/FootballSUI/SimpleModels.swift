import Foundation

struct Account: Codable {
    var firstName: String
    var lastName: String
    var email: String
    
    private enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        case firstName = "firstname"
        case lastName = "lastname"
        case email
    }
}

struct Paging: Codable {
    var current: Int
    var total: Int
}

struct Subscription: Codable {
    var plan: String
    var endDate: Date
    var isActive: Bool
    
    private enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        case plan
        case endDate = "end"
        case isActive = "active"
    }
}

struct Requests: Codable {
    var current: Int
    var dailyLimit: Int
    
    private enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        case current
        case dailyLimit = "limit_day"
    }
}

struct Team: Codable {
    var id: Int
    var name: String
    var code: String
    var country: String
    var founded: Int
    var national: Bool
    var logo: String
}

struct Venue: Codable {
    var id: Int
    var name: String
    var address: String
    var city: String
    var capacity: Int
    var surface: String
    var image: String
}

struct League: Codable {
    var id : Int
    var name: String
    var country: String
    var logo: String
    var flag: String
    var season: Int
}

struct Country: Codable {
    var name: String
    var code: String
    var flag: String
}

struct Season: Codable {
    var year: Int
    var start: String
    var end: String
    var isCurrent: Bool
    var coverage: Coverage
    
    private enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        case year
        case start
        case end
        case isCurrent = "current"
        case coverage
    }
}

struct Fixtures: Codable {
    var events: Bool
    var lineups: Bool
    var statisFixtures: Bool
    var statsPlayers: Bool
    
    private enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        case events
        case lineups
        case statisFixtures = "statistics_fixtures"
        case statsPlayers = "statistics_players"
    }
}

struct Coverage: Codable {
    var fixtures: Fixtures
    var standings: Bool
    var players: Bool
    var topScorers: Bool
    var topAssists: Bool
    var topCards: Bool
    var injuries: Bool
    var predictions: Bool
    var odds: Bool
    
    private enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        case fixtures
        case standings
        case players
        case topScorers = "top_scorers"
        case topAssists = "top_assists"
        case topCards = "top_cards"
        case injuries
        case predictions
        case odds
    }
}



struct HAT<T: Codable>: Codable {
    var hone: T
    var away: T
    var total: T
}
