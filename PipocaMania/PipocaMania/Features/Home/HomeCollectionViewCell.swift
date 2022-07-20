//
//  HomeCollectionViewCell.swift
//  PipocaMania
//
//  Created by Ana Luiza on 6/8/22.
//

import UIKit

protocol HomeCollectionViewCellDelegate {
    func isFavoritedButtonTouched(indexPath: Int)
}

class HomeCollectionViewCell: UICollectionViewCell {
 // receber os componentes
   
    @IBOutlet var pontuacaoFilme: UIView!
    @IBOutlet var tituloFilme: UIView!
    @IBOutlet var textoFilme: UILabel!
    @IBOutlet var estrelaFilme: UIButton!
    @IBOutlet var notaFilme: UILabel!
    @IBOutlet var posterFilme: UIImageView!
    @IBOutlet var starButton: UIButton!
    
    var cellDelegate: HomeCollectionViewCellDelegate?
    
    var item: Int? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = self.layer.frame.width/10
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = CGColor.init(red: 255, green: 255, blue: 255, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
    }
    
    @IBAction func favoritarAction(_ sender: UIButton) {
        cellDelegate?.isFavoritedButtonTouched(indexPath: self.item!)
    }
}




