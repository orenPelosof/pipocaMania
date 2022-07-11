//
//  FilterViewController.swift
//  PipocaMania
//
//  Created by Oren Pelosof on 30/05/22.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet var filterSearchBar: UISearchBar!
    @IBOutlet var filmesSeriesSegmentedControl: UISegmentedControl!
    @IBOutlet var postersCollectionView: UICollectionView!
    @IBOutlet var categoriasLabel: UILabel!
    
    let viewModel: CategoryViewModel = CategoryViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        postersCollectionView.delegate = self
        postersCollectionView.dataSource = self
        filterSearchBar.delegate = self
        filmesSeriesSegmentedControl.isHidden = true
        viewModel.consultaFilmes()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        postersCollectionView.collectionViewLayout = layout
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.postersCollectionView.frame.size.width / 2.3, height: self.postersCollectionView.frame.size.height / 2.2)
                layout.minimumInteritemSpacing = 20
                layout.minimumLineSpacing = 20
    }
    
    @IBAction func segmentSelectedAction(_ sender: Any) {
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        if segmentSelected == 0 {
            title = "Buscar Filmes"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieDetailsViewController = segue.destination as? MovieDetailsViewController,
           let idMovie = sender as? Int {
            movieDetailsViewController.idMovie = idMovie
        }
    }
}

extension FilterViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailView", sender: viewModel.listaDeFilmes[indexPath.item].id)
    }
}

extension FilterViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        
            
        return viewModel.listaDeFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell()}
        cell.posterImageView.layer.cornerRadius = cell.posterImageView.bounds.height / 10
        
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        
        if segmentSelected == 0 {
            cell.configureCell(viewModel.listaDeImagens[indexPath.row], viewModel.listaDeFilmes[indexPath.row].title)
            return cell
        } else {
            cell.configureCell(viewModel.listaDeImagens[indexPath.row], viewModel.listaDeFilmes[indexPath.row].title)
            return cell
        }
    }
}

extension FilterViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        if segmentSelected == 0 {
            if let searchMovie = searchBar.text, !searchMovie.isEmpty {
                self.postersCollectionView.isHidden = true
                //            self.loading.startAnimating()
                //            self.loading.isHidden = false
                viewModel.realizaPesquisa(from: viewModel.listaDeFilmes, searchText: searchText)
            } else {
                self.postersCollectionView.isHidden = true
                //            self.loading.startAnimating()
                //            self.loading.isHidden = false
                viewModel.consultaFilmes()
            }
        }
        
//        if segmentSelected == 1 {
//            if let searchMovie = searchBar.text, !searchMovie.isEmpty {
//                self.postersCollectionView.isHidden = true
//                //            self.loading.startAnimating()
//                //            self.loading.isHidden = false
//                viewModel.realizaPesquisa(from: viewModel.listaDeFilmes, searchText: searchText)
//            } else {
//                self.postersCollectionView.isHidden = true
//                //            self.loading.startAnimating()
//                //            self.loading.isHidden = false
//                viewModel.consultaFilmes()
//            }
//            postersCollectionView.reloadData()
//
//        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
    
}
extension FilterViewController: CategoryViewModelDelegate{
    func atualizaFilmes() {
        postersCollectionView.isHidden = false
        postersCollectionView.reloadData()
    }
    
    func finishedFiltering() {
        postersCollectionView.isHidden = false
        postersCollectionView.reloadData()
    }
    
    func searchIsEmpty() {
        postersCollectionView.isHidden = false
        viewModel.consultaFilmes()
        postersCollectionView.reloadData()
    }
    
    
    func atualizaCategorias() {
        
    }
    
}
