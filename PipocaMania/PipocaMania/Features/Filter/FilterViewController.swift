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
    @IBOutlet var moviesCollectionView: UICollectionView!
    
    var seriesImages: [String] = ["strangerthings", "arrow", "elite", "flash", "moonknight"]
    
    var moviesImages: [String] = ["sonic", "batman", "doctorstrange","morbius"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

}

extension FilterViewController: UICollectionViewDelegate {
    
}

extension FilterViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return seriesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell()}
        cell.configureCell(seriesImages.sorted()[indexPath.row])
        return cell
        
    }
    
    
}
