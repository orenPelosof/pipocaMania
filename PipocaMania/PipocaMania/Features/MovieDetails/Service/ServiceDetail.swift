import Foundation

protocol MovieDetailsServiceProtocol: AnyObject {
    func getMovieDetails(id: Int, completion: @escaping (Result<MovieModel?, Error>) -> Void)
}

final class MovieDetailsService: MovieDetailsServiceProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getMovieDetails(id: Int, completion: @escaping (Result<MovieModel?, Error>) -> Void) {
        session.dataTask(with: Endpoint.movie(id: id).url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else {
                    data?.parse(completion: completion)
                }
            }
        }
        .resume()
    }
}
