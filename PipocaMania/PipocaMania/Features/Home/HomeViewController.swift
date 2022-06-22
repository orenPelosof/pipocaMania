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
    var viewModel: HomeViewModel = HomeViewModel()
    var arrayDeImagens: [UIImage] = []
    var arrayFilmes: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.dataSource = self
        CollectionView.delegate = self
        viewModel.delegate = self
        viewModel.consultaFilmes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    func atualizaImagens(listaDeImagens: [UIImage]) {
        arrayDeImagens = listaDeImagens
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
        }
    }
    
    func atualizaListaDeFilmes(listaDeFilmes: [Result]) {
        arrayFilmes = listaDeFilmes
        viewModel.retornaImagem(listaDeFilmes: arrayFilmes)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "filmeCell", for: indexPath) as! HomeCollectionViewCell
        cell.posterFilme.image = arrayDeImagens[indexPath.item]
        cell.textoFilme.text = arrayFilmes[indexPath.item].title
        cell.notaFilme.text = String(arrayFilmes[indexPath.item].voteAverage)
        
        cell.tituloFilme.layer.cornerRadius = 10
        cell.pontuacaoFilme.layer.cornerRadius = 10
        cell.estrelaFilme.tintColor = .yellow
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailView", sender: indexPath)
    }
}
