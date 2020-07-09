//
//  LogoutTableviewCell.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 9/7/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import UIKit

protocol SignOutTableViewCellDelegate: class {
    func signOutTableViewCellDidTapSignoutButton(_ source: SignOutTableviewCell)
}

class SignOutTableviewCell: UITableViewCell {
    weak var delegate: SignOutTableViewCellDelegate?
    var signoutButton: UIButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        selectionStyle = .none
        setupSignoutButton()
        setupBindings()
    }
    
    /// Setups signoutButton
    private func setupSignoutButton() {
        signoutButton.setTitle("Sign Out", for: .normal)
        signoutButton.setTitleColor(.red, for: .normal)

        contentView.addSubview(signoutButton)

        signoutButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalToSuperview()
        }
    }
    
    /// Setups action binding
    private func setupBindings() {
        signoutButton.reactive.controlEvents(.touchUpInside).observeValues { [unowned self] _ in
            self.delegate?.signOutTableViewCellDidTapSignoutButton(self)
        }
    }
}
