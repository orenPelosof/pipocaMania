import Foundation

enum Endpoint {
    case movie(id: Int)
    case similiarMovies(id: Int)
    
    var url: URL {
        switch self {
        case .movie(let id):
            return URL(string: "\(Environment.basePath)/movie/\(id)?api_key=\(Environment.apiKey)")!
        case .similiarMovies(let id):
            return URL(string: "\(Environment.basePath)/movie/\(id)/similar?api_key=\(Environment.apiKey)")!
        }
    }
    
}
