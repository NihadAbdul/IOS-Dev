//
//  UserResponseModel.swift
//  Hometask_github_application
//
//  Created by Nihad on 27.05.24.
//

import UIKit

struct UserResponseModel: Decodable{
    let name: String
    let bio: String?
    let following: Int
    let followers: Int
    let public_repos: Int
    let avatar_url: String
}
