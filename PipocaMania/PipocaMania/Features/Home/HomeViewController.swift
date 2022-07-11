//
//  HomeViewController.swift
//  PipocaMania
//
//  Created by Ana Luiza on 6/8/22.
//

import UIKit

class HomeViewController: UIViewController {
    // criacao da collection view
    
    @IBOutlet var CollectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var loading: UIActivityIndicatorView!
    
    var viewModel: HomeViewModel = HomeViewModel()
    var listaDePesquisaDeImagens: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.dataSource = self
        CollectionView.delegate = self
        viewModel.delegate = self
        searchBar.delegate = self
        viewModel.consultaFilmes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieDetailsViewController = segue.destination as? MovieDetailsViewController,
           let idMovie = sender as? Int {
            movieDetailsViewController.idMovie = idMovie
        }
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    func atualizaFilmes() {
        loading.stopAnimating()
        CollectionView.isHidden = false
        self.CollectionView.reloadData()
        
        
    }
    
    func finishedFiltering() {
        loading.stopAnimating()
        CollectionView.isHidden = false
        CollectionView.reloadData()
    }
    
    func searchIsEmpty() {
        viewModel.consultaFilmes()
        CollectionView.reloadData()
        
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.retornaQuantidadeFilmes()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "filmeCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.posterFilme.image = viewModel.listaDeImagens[indexPath.item]
        cell.textoFilme.text = viewModel.listaDeFilmes[indexPath.item].title
        cell.notaFilme.text = String(viewModel.listaDeFilmes[indexPath.item].voteAverage)
        
        cell.tituloFilme.layer.cornerRadius = 10
        cell.pontuacaoFilme.layer.cornerRadius = 10
        cell.estrelaFilme.tintColor = .yellow
        cell.posterFilme.layer.cornerRadius = 10
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailView", sender: viewModel.listaDeFilmes[indexPath.item].id)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width/1.3, height: collectionView.frame.size.height/1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchMovie = searchBar.text, !searchMovie.isEmpty {
            self.CollectionView.isHidden = true
            self.loading.startAnimating()
            self.loading.isHidden = false
            viewModel.realizaPesquisa(from: viewModel.listaDeFilmes, searchText: searchText)
        } else {
            self.CollectionView.isHidden = true
            self.loading.startAnimating()
            self.loading.isHidden = false
            viewModel.consultaFilmes()
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


