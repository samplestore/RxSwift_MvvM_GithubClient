//
//  GitHubService.swift
//  RxMvvmSwiftExample
//
//  Created by Seongjae Lee on 2018. 9. 5..
//  Copyright © 2018년 Gunter. All rights reserved.
//

import Foundation
import RxSwift

enum GitHub {
    
    case userSearch(query: String, token: String)

    var url: String {
        switch self {
        case .userSearch(let query,let token):
             return "https://api.github.com/search/users?q=\(query)&access_token=\(token)"
        }
    }
    
}

protocol GitHubServicing {
    func userSearch(query: String) -> Observable<GitHubUserSearch>
}


class GitHubService: GitHubServicing {
    
    private let network: Networking

    init(){
        network = Network();
    }
    
    func userSearch(query: String) -> Observable<GitHubUserSearch> {
        let url = GitHub.userSearch(query: query, token: Keys.GitHubAccessToken).url
        return network.request(method: .get, url: url, parameters: nil, type: GitHubUserSearch.self)
    }
    

    
    
}
