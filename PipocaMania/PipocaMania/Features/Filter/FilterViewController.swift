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
    
    var filmesImages: [String] = ["sonic", "batman", "doctorstrange","morbius"]
    
    var imagensIniciais: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        title = "oi"
        
        postersCollectionView.delegate = self
        postersCollectionView.dataSource = self
        
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
            return filmesImages.count
        } else {
            return seriesImages.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell()}
        let segmentSelected = filmesSeriesSegmentedControl.selectedSegmentIndex
        if segmentSelected == 0 {
            cell.configureCell(filmesImages.sorted()[indexPath.row])
            postersCollectionView.reloadData()
            return cell
        } else {
            cell.configureCell(seriesImages.sorted()[indexPath.row])
            postersCollectionView.reloadData()
            return cell
        }
    }
    
    
}
