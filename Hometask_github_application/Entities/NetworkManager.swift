//
//  NetworkManager.swift
//  Hometask_github_application
//
//  Created by Nihad on 27.05.24.
//

import UIKit
import Alamofire


class NetworkManager{
    static let shared = NetworkManager()
    
    func getUserInfo(username: String, completion: @escaping (Result<UserResponseModel, AFError>) -> Void){
        let baseUrl = "https://api.github.com/users/\(username)"
        AF.request(baseUrl).responseDecodable(of: UserResponseModel.self) { response in
            completion(response.result)
        }
    }
}
