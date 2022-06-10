//
//  DetailViewController.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 08/06/22.
//

import UIKit

final class DetailViewController: UIViewController {
    private let detailView: DetailView = .loadFromNib()
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
}
