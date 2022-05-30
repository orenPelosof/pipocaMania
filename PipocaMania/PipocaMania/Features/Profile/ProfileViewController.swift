//
//  ProfileViewController.swift
//  PipocaMania
//
//  Created by Tiago Deanna on 28/05/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var ProfileTableView: UITableView!    

    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileTableView.dataSource = self
        ProfileTableView.delegate = self
        ProfileTableView.rowHeight = 164
        ProfileTableView.sectionHeaderHeight = 150
        ProfileTableView.register(
            UINib(nibName: ProfileTableViewCell.identifier, bundle: Bundle.main),
            forCellReuseIdentifier: ProfileTableViewCell.identifier
        )
        ProfileTableView.register(
            UINib(nibName: HeaderProfileTableViewCell.identifier, bundle: Bundle.main),
            forCellReuseIdentifier: HeaderProfileTableViewCell.identifier
        )
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProfileTableViewCell.identifier, for: indexPath
        ) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let cell = tableView.dequeueReusableCell(
        withIdentifier: HeaderProfileTableViewCell.identifier
    ) as? HeaderProfileTableViewCell else {
        return UITableViewCell()
    }
    cell.profileImageView.layer.cornerRadius = 40
    return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
 
}
