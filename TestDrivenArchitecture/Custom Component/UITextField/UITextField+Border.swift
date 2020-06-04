//
//  UITextField+Border.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 2/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func setAttributes(placeHolderValue: String) {
        self.font = UIFont.systemFont(ofSize: 14)
        self.textColor = .white
        self.backgroundColor = Asset.Colors.wine.color
        self.setBottomBorder()
        self.attributedPlaceholder = NSAttributedString(
            string: placeHolderValue,
            attributes: [.foregroundColor: UIColor.white])
        self.autocapitalizationType = .none
    }
}
