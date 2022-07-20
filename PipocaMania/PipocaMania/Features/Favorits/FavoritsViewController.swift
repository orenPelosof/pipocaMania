//
//  FavoritsViewController.swift
//  PipocaMania
//
//  Created by Ana Luiza on 7/4/22.
//

import UIKit
import Reusable

class FavoritsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    private var coreData = DataBaseHelper()
    var filmesFavoritos: [Filme] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .primary
        tableView.register(cellType: FavoriteTableViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavorites()
        tableView.reloadData()
    }
    
    func fetchFavorites(){
        coreData.requestFavorites { (favorites: Result<[Filme], Error>) in
            switch favorites {
            case .success(let favorites):
                self.filmesFavoritos = favorites
            case .failure(let failure):
                print(failure)
                
            }
        }
    }
    
    
}

extension FavoritsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filmesFavoritos.isEmpty {
            return 1
        }
        return filmesFavoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if filmesFavoritos.isEmpty {
            let errorCell = UITableViewCell()
            errorCell.textLabel?.text = "não há filmes"
            return errorCell
        }
        let cell: FavoriteTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        cell.update(with: filmesFavoritos[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           // Make the first row larger to accommodate a custom cell.
        if filmesFavoritos.isEmpty {
              return 80
           }

           // Use the default size for all other rows.
           return 240

    }
    
}
