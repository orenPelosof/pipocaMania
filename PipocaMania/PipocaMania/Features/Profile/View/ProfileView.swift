import UIKit
import Reusable

protocol ProfileViewDelegate {
    func imagemClick()
}

final class ProfileView: UIView, NibLoadable {
    weak var footerDelegate: ProfileFooterViewDelegate?
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var data: ProfileModel?
    
    var image: UIImage?
    
    var delegate: ProfileViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.backgroundColor = .primary
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 64
        tableView.separatorColor = .lightGray
        tableView.separatorInset = .zero
        tableView.register(cellType: ProfileViewCell.self)
        tableView.register(headerFooterViewType: ProfileHeaderView.self)
        tableView.register(headerFooterViewType: ProfileFooterView.self)
    }
    
    func update(with data: ProfileModel) {
        self.data = data
        tableView.reloadData()
    }
}

extension ProfileView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.infos.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProfileViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.update(with: data?.infos[indexPath.row])
        return cell
    }
}

extension ProfileView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(ProfileHeaderView.self)
        var profileImage: UIImage?
        
        if image == nil {
            profileImage = UIImage(named: data?.imageName ?? String())
        } else {
            profileImage = image
        }
        
        header?.update(name: data?.name, imageName: profileImage)
        header?.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(ProfileFooterView.self)
        footer?.delegate = footerDelegate
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        320
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        64
    }
}

extension ProfileView: ProfileHeaderViewDelegate {
    func imagemClick() {
        delegate?.imagemClick()
    }
    
    
}
