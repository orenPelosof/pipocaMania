import UIKit

final class MovieDetailsViewController: UIViewController {
    var idMovie: Int?
    
    private let movieDetailsView: MovieDetailsView = .loadFromNib()
    
    private lazy var viewModel: MovieDetailsViewModel = {
        let viewModel  = MovieDetailsViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    override func loadView() {
        super.loadView()
        movieDetailsView.viewDelegate = self
        view = movieDetailsView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCoreData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovieDetails(id: idMovie ?? 0)
        viewModel.getSimilarMovies(id: idMovie ?? 0)
    }
}

extension MovieDetailsViewController: MovieDetailsViewModelDelegate {
    func showDetails(of movie: MovieModel?) {
        
        if viewModel.checkFavorite(movieName: (movie?.originalTitle)!){
            let image = "star.fill"
            
            movieDetailsView.update(with: movie, with: image)
        } else {
            let image = "star"
            
            movieDetailsView.update(with: movie, with: image)
        }
    }
    
    func showSimilar(movies: [MovieModel]) {
        movieDetailsView.update(with: movies)
    }
    
    func showEmptyFieldError() {
        
    }
    
    func showError(message: String?) {
        print(message ?? String())
    }
}

extension MovieDetailsViewController: MovieDetailsViewDelegate {
    func isStarButtonTouched(film: MovieModel) {
        viewModel.isStarButtonTouched(movie: film)
        showDetails(of: film)
    }
    
}
