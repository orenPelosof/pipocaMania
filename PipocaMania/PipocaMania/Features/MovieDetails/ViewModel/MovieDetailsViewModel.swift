protocol MovieDetailsViewModelDelegate: AnyObject {
    func showDetails(of movie: MovieModel?)
    func showSimilar(movies: [MovieModel])
    func showEmptyFieldError()
    func showError(message: String?)
}

final class MovieDetailsViewModel {
    weak var delegate: MovieDetailsViewModelDelegate?
    
    private let service: MovieDetailsServiceProtocol
    
    init(service: MovieDetailsServiceProtocol = MovieDetailsService()) {
        self.service = service
    }
    
    func getMovieDetails(id: Int) {
        service.getMovieDetails(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(movie):
                self.delegate?.showDetails(of: movie)
                
            case let .failure(error):
                self.delegate?.showError(message: error.localizedDescription)
            }
        }
    }
    
    func getSimilarMovies(id: Int) {
        service.getSimilarMovies(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {  
            case let .success(movies):
                self.delegate?.showSimilar(movies: movies?.results ?? [])
                
            case let .failure(error):
                self.delegate?.showError(message: error.localizedDescription)
            }
        }
    }
}
