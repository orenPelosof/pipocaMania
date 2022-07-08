import Foundation

enum Endpoint {
    case movie(id: Int)
    
    var url: URL {
        switch self {
        case .movie(let id):
            return URL(string: "\(Environment.basePath)/movie/\(id)?api_key=\(Environment.apiKey)")!
        }
    }
    
}
