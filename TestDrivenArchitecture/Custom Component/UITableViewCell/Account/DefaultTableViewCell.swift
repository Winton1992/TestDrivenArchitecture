//
//  DefaultTableViewCell.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 8/7/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {
    let defaults = UserDefaults.standard
    let leftLabel: UILabel = UILabel()
    let rightLabel: UILabel = UILabel()
    let version: Any = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")!
    let build: Any = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        setupLeftLabel()
        setupRightLabel()
    }
    
    private func setupLeftLabel() {
        leftLabel.textColor = .black
        leftLabel.textAlignment = .left
        
        addSubview(leftLabel)
        
        leftLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
    }
    
    private func setupRightLabel() {
        rightLabel.textColor = .gray
        rightLabel.textAlignment = .left
        
        addSubview(rightLabel)
        
        rightLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    func set(section: Int) {
        if section == 1 {
            setupAboutValue()
        }
    }
    
    private func setupAboutValue() {
        leftLabel.text = "About"
        if let version = self.version as? String, let build = self.build as? String {
            rightLabel.text = L10n.appVersion(String(version), String(build))
        }
    }
}

