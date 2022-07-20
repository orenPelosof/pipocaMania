//
//  RelatedMoviesViewCell.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 08/06/22.
//

import UIKit
import Reusable

final class RelatedMoviesViewCell: UITableViewCell, NibLoadable, Reusable {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var relatedMovies: [MovieModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .primary
        selectionStyle = .none

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 140, height: 190)
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0.0

        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cellType: MoviesCollectionViewCell.self)
    }
    
    func update(with relatedMovies: [MovieModel]) {
        self.relatedMovies = relatedMovies
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension RelatedMoviesViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return relatedMovies.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: MoviesCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.update(with: relatedMovies[indexPath.row])
        return cell
    }
}

extension RelatedMoviesViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
}
