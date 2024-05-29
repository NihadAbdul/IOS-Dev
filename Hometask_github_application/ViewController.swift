//
//  ViewController.swift
//  Hometask_github_application
//
//  Created by Nihad on 27.05.24.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    private let headerStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 8
        sv.alignment = .fill
        return sv
    }()
    private let searchTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search username"
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1
        return tf
    }()
    private let searchButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("search", for: .normal)
        btn.backgroundColor = UIColor(named: "primaryColor")
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(didChangeUserInfo), for: .touchUpInside)
        return btn
    }()
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    private let fullnameBioStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 8
        sv.alignment = .center
        return sv
    }()
    private let fullnameTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let bioSubtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    private let userInfoStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.alignment = .center
        sv.distribution = .fillEqually
        return sv
    }()
    private let followersTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    private let followingsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    private let publicReposTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    @objc
    private func didChangeUserInfo(){
        NetworkManager.shared.getUserInfo(username: searchTextField.text ?? "") { result in
            switch result {
            case .success(let data):
                self.fullnameTitleLabel.text = data.name
                self.bioSubtitleLabel.text = data.bio
                self.followersTitleLabel.text = "\(data.followers) Followers"
                self.followingsTitleLabel.text = "\(data.following) Following"
                self.publicReposTitleLabel.text = "\(data.public_repos) Public Repos"
                self.profileImageView.kf.setImage(with: URL(string: data.avatar_url))
            case .failure(let error):
                print("error", error)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configuratedConstraints()
    }
    private func dataResult(){
        
    }
    private func setup(){
        view.addSubview(headerStackView)
        view.addSubview(profileImageView)
        view.addSubview(fullnameBioStackView)
        view.addSubview(userInfoStackView)
        view.backgroundColor = UIColor(named: "bgColor")
        [
            searchTextField,
            searchButton
            
        ].forEach(headerStackView.addArrangedSubview)
        
        [
            fullnameTitleLabel,
            bioSubtitleLabel
            
        ].forEach(fullnameBioStackView.addArrangedSubview)
        
        [
            followersTitleLabel,
            followingsTitleLabel,
            publicReposTitleLabel
            
        ].forEach(userInfoStackView.addArrangedSubview)
    }
    private func configuratedConstraints(){
        
        searchTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        headerStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom).offset(16)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(120)
        }
        fullnameBioStackView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        userInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(fullnameBioStackView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}

