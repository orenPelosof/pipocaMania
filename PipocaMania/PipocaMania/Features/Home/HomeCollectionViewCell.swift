//
//  HomeCollectionViewCell.swift
//  PipocaMania
//
//  Created by Ana Luiza on 6/8/22.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
 // receber os componentes
   
    @IBOutlet var pontuacaoFilme: UIView!
    @IBOutlet var tituloFilme: UIView!
    @IBOutlet var textoFilme: UILabel!
    @IBOutlet var estrelaFilme: UIImageView!
    @IBOutlet var notaFilme: UILabel!
    @IBOutlet var posterFilme: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        estrelaFilme.isUserInteractionEnabled = true
        estrelaFilme.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if let imageData = posterFilme.image?.pngData() {
            
        DataBaseHelper.shareInstance.saveFilm(data: imageData, title: textoFilme.text!)
        }
    }
    
}




