//
//  HomeViewController.swift
//  PipocaMania
//
//  Created by Ana Luiza on 6/8/22.
//

import UIKit
import Kingfisher

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
        
        let cellSize = CGSize(width:350 , height:450)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        layout.minimumLineSpacing = 20.0
        layout.minimumInteritemSpacing = 20.0
        CollectionView.setCollectionViewLayout(layout, animated: true)
        
        CollectionView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        viewModel.fetchCoreData()
        CollectionView.reloadData()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
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
        CollectionView.reloadData()
        
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.isSearching {
            return viewModel.listaDePesquisa.count
        }
        return viewModel.retornaQuantidadeFilmes()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "filmeCell", for: indexPath) as! HomeCollectionViewCell
        
        if viewModel.isSearching {
            KF.url(URL(string: "https://image.tmdb.org/t/p/w500\(viewModel.listaDePesquisa[indexPath.item].posterPath)")).set(to: cell.posterFilme)

            cell.textoFilme.text = viewModel.listaDePesquisa[indexPath.item].title
            cell.notaFilme.text = String(viewModel.listaDePesquisa[indexPath.item].voteAverage)
            
            if viewModel.checkFavorite(movieName: viewModel.listaDePesquisa[indexPath.row].originalTitle){
                cell.estrelaFilme.setImage(UIImage(systemName: "star.fill"), for: .normal)
            } else {
                cell.estrelaFilme.setImage(UIImage(systemName: "star"), for: .normal)
            }
            
            return cell
        }
        
        KF.url(URL(string: "https://image.tmdb.org/t/p/w500\(viewModel.listaDeFilmes[indexPath.item].posterPath)")).set(to: cell.posterFilme)

        cell.textoFilme.text = viewModel.listaDeFilmes[indexPath.item].title
        cell.notaFilme.text = String(viewModel.listaDeFilmes[indexPath.item].voteAverage)
        
        if viewModel.checkFavorite(movieName: viewModel.listaDeFilmes[indexPath.row].originalTitle){
            cell.estrelaFilme.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            cell.estrelaFilme.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        cell.tituloFilme.layer.cornerRadius = 10
        cell.pontuacaoFilme.layer.cornerRadius = 10
        cell.posterFilme.layer.cornerRadius = 10
        cell.item = indexPath.row
        cell.cellDelegate = self
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.05,
                       animations: {
            cell?.contentView.alpha = 0.7
            
        }) { (completed) in
            UIView.animate(withDuration: 0.05,
                           animations: {
                cell?.contentView.alpha = 1
            }) { (completed) in
                self.performSegue(withIdentifier: "detailView", sender: self.viewModel.listaDeFilmes[indexPath.item].id)
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !viewModel.isSearching {
            if (indexPath.item == viewModel.retornaQuantidadeFilmes() - 1 ) {
                viewModel.paginaAtual += 1
                viewModel.consultaFilmes()
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/1.3, height: collectionView.frame.size.height/1 - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchMovie = searchBar.text, !searchMovie.isEmpty {
            self.CollectionView.isHidden = true
            self.loading.startAnimating()
            self.loading.isHidden = false
            viewModel.realizaPesquisa(from: viewModel.listaDePesquisa, searchText: searchText)
            viewModel.isSearching = true
        } else {
            self.CollectionView.reloadData()
            viewModel.isSearching = false
            viewModel.listaDePesquisa = viewModel.listaDeFilmes
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: HomeCollectionViewCellDelegate {
    func isFavoritedButtonTouched(indexPath: Int) {
        viewModel.buttonHeartTappedAt(movieIndex: indexPath)
        CollectionView.reloadData()
    }
    
}
