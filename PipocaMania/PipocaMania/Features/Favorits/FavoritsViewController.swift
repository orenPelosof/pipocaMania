//
//  FavoritsViewController.swift
//  PipocaMania
//
//  Created by Ana Luiza on 7/4/22.
//

import UIKit

class FavoritsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var listaDeFilmesSalvos = DataBaseHelper.shareInstance.fetchImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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
        let newCell = UITableViewCell()
        newCell.imageView?.image = UIImage(data: listaDeFilmesSalvos[indexPath.row].imagem!)
        newCell.textLabel?.text = listaDeFilmesSalvos[indexPath.row].titulo
        return newCell
    }
}
