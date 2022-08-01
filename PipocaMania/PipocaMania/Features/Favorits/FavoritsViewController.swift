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
    
    func deleteFavorite(movie: Filme) { coreData.delete(movie: movie) }
    
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
        if filmesFavoritos.isEmpty {
            return 80
        }
        
        return 240
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.deleteFavorite(movie: filmesFavoritos[indexPath.row])
            tableView.reloadData()
        }
    }
}
