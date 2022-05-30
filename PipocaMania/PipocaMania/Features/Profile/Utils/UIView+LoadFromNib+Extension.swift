//
//  UIView+LoadFromNib+Extension.swift
//  PipocaMania
//
//  Created by Tiago Deanna on 30/05/22.
//

import UIKit

extension UIView {
    class func loadFromNib(named: String? = nil) -> Self {
        let name = named ?? "\(Self.self)"
        guard
            let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
            else { fatalError("missing expected nib named: \(name)") }
        guard let view = nib.first as? Self
            else { fatalError("view of type \(Self.self) not found in \(nib)") }
        return view
    }
}
