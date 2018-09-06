//
//  GitHubUser.swift
//  RxMvvmSwiftExample
//
//  Created by Seongjae Lee on 2018. 9. 5..
//  Copyright © 2018년 Gunter. All rights reserved.
//

import Himotoki

struct GitHubUser {
    let id: Int
    let username: String
    let avatarUrl: String
}

extension GitHubUser: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> GitHubUser {
        return try GitHubUser(
            id: e <| "id",
            username: e <| "login",
            avatarUrl: e <| "avatar_url"
        )
    }
}
