//
//  DetailView.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 08/06/22.
//

import UIKit
import Reusable

final class DetailView: UIView, NibLoadable {

    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.backgroundColor = .primary
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType: TitleDetailViewCell.self)
        tableView.register(cellType: InfoDetailViewCell.self)
        tableView.register(cellType: SynopsisDetailViewCell.self)
        tableView.register(cellType: RelatedMoviesViewCell.self)
        tableView.register(headerFooterViewType: DetailHeaderView.self)
    }
    
    private func makeCell(
        for tableView: UITableView,
        with indexPath: IndexPath
    ) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: TitleDetailViewCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 1:
            let cell: InfoDetailViewCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 2:
            let cell: SynopsisDetailViewCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        default:
            let cell: RelatedMoviesViewCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        }
    }
    
    private func getHeightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        case 1:
            return 80
        case 2:
            return 142
        default:
            return 160
        }
    }
    
}

extension DetailView: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        4
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        makeCell(for: tableView, with: indexPath)
    }
}

extension DetailView: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        getHeightForRowAt(indexPath: indexPath)
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(DetailHeaderView.self)
        return header
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        280
    }
    
    }
