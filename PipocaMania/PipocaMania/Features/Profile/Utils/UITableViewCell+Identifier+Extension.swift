//
//  UITableViewCell+Identifier+Extension.swift
//  PipocaMania
//
//  Created by Tiago Deanna on 30/05/22.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
