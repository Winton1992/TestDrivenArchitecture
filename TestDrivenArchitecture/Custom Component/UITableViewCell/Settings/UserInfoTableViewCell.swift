//
//  UserInfoTableViewCell.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 27/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Kingfisher
import UIKit

class UserInfoTableViewCell: UITableViewCell {
    let defaults = UserDefaults.standard
    let profileImageView: UIImageView = UIImageView()
    let accountLabel: UILabel = UILabel()
    let usernameLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        setupProfileImageView()
        setupUsernameLabel()
        setupAccountLabel()
    }
    
    private func setupProfileImageView() {
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 30
        let url = URL(string: "https://media-exp1.licdn.com/dms/image/C5603AQHYuNosOcB3Lg/profile-displayphoto-shrink_400_400/0?e=1599091200&v=beta&t=z8RYc7k-2Ey45P_l0jydc8vm1qnkdMNO_PvqCgujbqo")
        profileImageView.kf.setImage(with: url)
        
        addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(60)
        }
    }
    
    private func setupUsernameLabel() {
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        usernameLabel.textColor = .black
        if let username = defaults.string(forKey: "Username") {
            usernameLabel.text = username
        }
        
        addSubview(usernameLabel)
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(profileImageView.snp.right).offset(20)
        }
    }
    
    private func setupAccountLabel() {
        accountLabel.font = UIFont.systemFont(ofSize: 14)
        accountLabel.textColor = .gray
        //accountLabel.translatesAutoresizingMaskIntoConstraints = false
        if let userEmail = defaults.string(forKey: "Email") {
            accountLabel.text = "Account: \(userEmail)"
        }

        addSubview(accountLabel)

        accountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView.snp.centerY).offset(15)
            make.left.equalTo(usernameLabel.snp.left)
            make.bottom.lessThanOrEqualToSuperview().offset(-5)
        }
    }
}
