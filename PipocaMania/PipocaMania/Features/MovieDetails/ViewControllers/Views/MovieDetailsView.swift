import UIKit
import Reusable

protocol MovieDetailsViewDelegate {
    func isStarButtonTouched(film: MovieModel)
}

final class MovieDetailsView: UIView, NibLoadable {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var movie: MovieModel?
    private var relatedMovies: [MovieModel] = []
    private var imageWatchLater: String = ""
    
    var viewDelegate: MovieDetailsViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.backgroundColor = .primary
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: MovieTitleViewCell.self)
        tableView.register(cellType: MovieInfoViewCell.self)
        tableView.register(cellType: MovieSynopsisViewCell.self)
        tableView.register(cellType: RelatedMoviesViewCell.self)
        tableView.register(headerFooterViewType: MovieHeaderView.self)
    }
    
    func update(with movie: MovieModel?, with image: String) {
        self.movie = movie
        self.imageWatchLater = image
        tableView.reloadData()
    }
    
    func update(with relatedMovies: [MovieModel]) {
        self.relatedMovies = relatedMovies
        tableView.reloadData()
    }
    
    private func makeCell(
        for tableView: UITableView,
        with indexPath: IndexPath
    ) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: MovieTitleViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.update(with: movie)
            cell.watchLaterButton.setImage(UIImage(systemName: "\(imageWatchLater)"), for: .normal)
            cell.cellDelegate = self
            return cell
        case 1:
            let cell: MovieInfoViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.update(with: movie)
            return cell
        case 2:
            let cell: MovieSynopsisViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.update(with: movie)
            return cell
        default:
            let cell: RelatedMoviesViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.update(with: relatedMovies)
            return cell
        }
    }
    
    private func getHeightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 100
        case 1:
            return 64
        case 2:
            return 120
        default:
            return 196
        }
    }
}

extension MovieDetailsView: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        4
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        makeCell(for: tableView, with: indexPath)
    }
}

extension MovieDetailsView: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        getHeightForRowAt(indexPath: indexPath)
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(MovieHeaderView.self)
        header?.update(with: movie)
        return header
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        260
    }
}

extension MovieDetailsView: MovieTitleViewCellDelegate {
    func isStarButtonTouched(film: MovieModel) {
        viewDelegate?.isStarButtonTouched(film: film)
    }
    
    
}
