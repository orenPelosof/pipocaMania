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
    
    var listaDeFilmesSalvos = DataBaseHelper.shareInstance.fetchImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .primary
        tableView.register(cellType: FavoriteTableViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listaDeFilmesSalvos = DataBaseHelper.shareInstance.fetchImage()
        tableView.reloadData()
    }
    
    
}

extension FavoritsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listaDeFilmesSalvos.isEmpty {
            return 1
        }
        return listaDeFilmesSalvos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if listaDeFilmesSalvos.isEmpty {
            let errorCell = UITableViewCell()
            errorCell.textLabel?.text = "não há filmes"
            return errorCell
        }
        let cell: FavoriteTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.favoriteImageView?.image = UIImage(data: listaDeFilmesSalvos[indexPath.row].imagem!)
        cell.filmeTitleLabel?.text = listaDeFilmesSalvos[indexPath.row].titulo
        
        cell.descriptionLabel.text = listaDeFilmesSalvos[indexPath.row].titulo
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           // Make the first row larger to accommodate a custom cell.
        if listaDeFilmesSalvos.isEmpty {
              return 80
           }

           // Use the default size for all other rows.
           return 240

    }
    
}
