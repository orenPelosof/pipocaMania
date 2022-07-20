import Foundation

protocol MovieDetailsServiceProtocol: AnyObject {
    func getMovieDetails(id: Int, completion: @escaping (Result<MovieModel?, Error>) -> Void)
    func getSimilarMovies(id: Int, completion: @escaping (Result<SimilarMoviesModel?, Error>) -> Void)
}

final class MovieDetailsService: MovieDetailsServiceProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getMovieDetails(id: Int, completion: @escaping (Result<MovieModel?, Error>) -> Void) {
        request(with: Endpoint.movie (id: id), completion: completion)
    }
    
    func getSimilarMovies(id: Int, completion: @escaping (Result<SimilarMoviesModel?, Error>) -> Void) {
        request(with: Endpoint.similiarMovies (id: id), completion: completion)
    }
    
    private func request<Model: Decodable>(
        with endpoint: Endpoint,
        completion: @escaping (Result<Model?, Error>) -> Void
     ){
         session.dataTask(with: endpoint.url) { (data, response, error) in
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
