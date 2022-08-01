protocol MovieDetailsViewModelDelegate: AnyObject {
    func showDetails(of movie: MovieModel?)
    func showSimilar(movies: [MovieModel])
    func showEmptyFieldError()
    func showError(message: String?)
}

final class MovieDetailsViewModel {
    weak var delegate: MovieDetailsViewModelDelegate?
    
    private let service: MovieDetailsServiceProtocol
    
    var favorites : [Filme] = []
    
    var coreData = DataBaseHelper2()
    
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
    
    func isStarButtonTouched(movie: MovieModel){
        let toFavorite = movie
        if checkFavorite(movieName: toFavorite.originalTitle!){
            let favMovie = favorites.filter { item in item.titulo.contains(toFavorite.originalTitle!) }
             deleteFavorite(movie: favMovie[0])
             fetchCoreData()
     
         } else {
             saveFavorite(movie: toFavorite)
             fetchCoreData()
         }
    }
     

    func checkFavorite(movieName: String) -> Bool{return favorites.contains(where: {$0.titulo == movieName})}
     
     func deleteFavorite(movie: Filme) { coreData.delete(movie: movie) }
     
     func saveFavorite(movie: MovieModel){
         
         let convertDate = movie.releaseDate
         let year = String(convertDate!.prefix(4))
         let favoriteMovie: MovieToCoreData = MovieToCoreData(
             
            titulo: movie.originalTitle!,
            imagem: movie.posterPath!,
            descricao: movie.overview!)
         
         coreData.save(movie: favoriteMovie)
     }
     
     func fetchCoreData(){
         coreData.requestFavorites { (favoritesMoviesCoreData:Result<[Filme], Error>) in
             switch favoritesMoviesCoreData {
             case.success(let favoritesMoviesCoreData):
                 self.favorites = favoritesMoviesCoreData
             case.failure(let error):
                 print(error)
             }
         }
     }

 }
