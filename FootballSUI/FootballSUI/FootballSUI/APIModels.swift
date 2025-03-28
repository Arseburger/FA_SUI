import Foundation

struct RequestResult<T: Codable>: Codable {
    var get: String
    var parameters: Parameters
    var errors: [String]
    var results: Int
    var paging: Paging
    var response: T
}

struct Parameters: Codable {
    
}

struct TeamResult: Codable {
    var team: Team
    var venue: Venue
}

struct StatusResult: Codable {
    var account: Account
    var subscription: Subscription
    var requests: Requests
}

struct LeagueResult: Codable {
    var league: League
    var team: Team
    var matches: Matches
    var goals: Goals
}
