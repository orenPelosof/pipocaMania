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
        view = movieDetailsView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let idMovie = idMovie {
        viewModel.getMovieDetails(id: idMovie ?? 0)
        viewModel.getSimilarMovies(id: idMovie ?? 0)
//        }
    }
}

extension MovieDetailsViewController: MovieDetailsViewModelDelegate {
    func showDetails(of movie: MovieModel?) {
        movieDetailsView.update(with: movie)
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
