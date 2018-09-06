//
//  GitHubUserSearch.swift
//  RxMvvmSwiftExample
//
//  Created by Seongjae Lee on 2018. 9. 5..
//  Copyright © 2018년 Gunter. All rights reserved.
//

import Himotoki

struct GitHubUserSearch {
    let count: Int
    let users: [GitHubUser]
}

extension GitHubUserSearch: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> GitHubUserSearch {
        return try GitHubUserSearch(
            count: e <| "total_count",
            users: e <|| "items"
        )
    }
}
