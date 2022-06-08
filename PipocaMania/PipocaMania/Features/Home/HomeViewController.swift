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
    
    var ArrayFilmes = ["Star Wars: Os Últimos Jedi", "Vingadores", "Liga da Justiça"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.dataSource = self
        CollectionView.delegate = self
        
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrayFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "filmeCell", for: indexPath) as! HomeCollectionViewCell
        cell.posterFilme.image = UIImage(named: ArrayFilmes[indexPath.item])
        cell.textoFilme.text = ArrayFilmes[indexPath.item]
        
        cell.tituloFilme.layer.cornerRadius = 10
        cell.pontuacaoFilme.layer.cornerRadius = 10
        cell.estrelaFilme.tintColor = .yellow
        
        return cell
        
    }
}
