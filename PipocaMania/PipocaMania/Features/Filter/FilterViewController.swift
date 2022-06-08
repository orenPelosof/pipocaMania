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
    
    var seriesImages: [String] = ["strangerthings", "arrow", "elite", "flash", "moonknight"]
    
    var filmesImages: [String] = ["sonic", "batman", "doctorstrange", "morbius"]
    
    var filtroFilmes: [String] = []
    
    var filtroSeries: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filtroFilmes = filmesImages
        filtroSeries = seriesImages
        postersCollectionView.delegate = self
        postersCollectionView.dataSource = self
        filterSearchBar.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentSelectedAction(_ sender: Any) {
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        if segmentSelected == 0 {
            title = "Buscar Filmes"
        } else {
            title = "Buscar Séries"
        }
    }
    
}

extension FilterViewController: UICollectionViewDelegate {
    
}

extension FilterViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        if segmentSelected == 0 {
            
            return filtroFilmes.count
        } else {
            
            return filtroSeries.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell()}
        
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        
        if segmentSelected == 0 {
            cell.configureCell(filtroFilmes.sorted()[indexPath.row])
            postersCollectionView.reloadData()
            return cell
        } else {
            cell.configureCell(filtroSeries.sorted()[indexPath.row])
            postersCollectionView.reloadData()
            return cell
        }
    }
}

extension FilterViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        if segmentSelected == 0 {
            filtroFilmes = []
            if searchText.isEmpty {
                filtroFilmes = filmesImages
            } else {
                for filme in filmesImages {
                    if filme.uppercased().contains(searchText.uppercased()) {
                        filtroFilmes.append(filme)
                    }
                }
            }
        }
        if segmentSelected == 1 {
            filtroSeries = []
            if searchText.isEmpty {
                filtroSeries = seriesImages
            } else {
                for serie in seriesImages {
                    if serie.uppercased().contains(searchText.uppercased()) {
                        filtroSeries.append(serie)
                    }
                }
            }
        }
        postersCollectionView.reloadData()

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
    }
}
