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
    }
    
    @IBAction func segmentSelectedAction(_ sender: Any) {
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        if segmentSelected == 0 {
            title = "Buscar Filmes"
        }
    }
    
}

extension FilterViewController: UICollectionViewDelegate {
    
}

extension FilterViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        
            
        return viewModel.listaDeFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell()}
        
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        
        if segmentSelected == 0 {
            cell.configureCell(viewModel.listaDeImagens[indexPath.row], viewModel.listaDeFilmes[indexPath.row].title)
            postersCollectionView.reloadData()
            return cell
        } else {
            cell.configureCell(viewModel.listaDeImagens[indexPath.row], viewModel.listaDeFilmes[indexPath.row].title)
            postersCollectionView.reloadData()
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
