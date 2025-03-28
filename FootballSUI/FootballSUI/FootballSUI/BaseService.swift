import UIKit

extension URLRequest {
    
    static let apiKey = "52a7903211d07a1efae41cfa540ce2fe"
    
    mutating func addHeaders() {
        self.addValue(URLRequest.apiKey, forHTTPHeaderField: "x-rapidapi-key")
        self.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
    }
}


final class BaseService {
    private let session = URLSession.shared
    private let baseURL = "https://v3.football.api-sports.io"
    
    func loadStatus(completion: @escaping (RequestResult<StatusResult>) -> Void) {
        guard let url = URL(string: baseURL + "/status") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addHeaders()
        
        
        session.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let result = try decoder.decode(RequestResult<StatusResult>.self, from: data)
                    completion(result)
                } catch {
                    print("Error parsing JSON: \(error.localizedDescription)")
                }
            }
            
        }.resume()
        
    }
    
    func loadTeam(params: String, completion: @escaping (RequestResult<[TeamResult]>) -> Void) {
        guard let url = URL(string: baseURL + "/teams" + "?\(params)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addHeaders()
        
        session.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.assumesTopLevelDictionary = true
                    let result = try decoder.decode(RequestResult<[TeamResult]>.self, from: data)
                    completion(result)
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }.resume()
    }
    
    func loadLeague(params: String, completion: @escaping (RequestResult<LeagueResult>) -> Void) {
        guard let url = URL(string: baseURL + "/teams" + "?\(params)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addHeaders()
        
        session.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.assumesTopLevelDictionary = true
                    let result = try decoder.decode(RequestResult<LeagueResult>.self, from: data)
                    completion(result)
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }.resume()
    }
    
}

