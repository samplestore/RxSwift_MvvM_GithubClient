//
//  ProfileViewModel.swift
//  RxMvvmSwiftExample
//
//  Created by Seongjae Lee on 2018. 9. 6..
//  Copyright © 2018년 Gunter. All rights reserved.
//

import Foundation
import RxSwift

protocol ProfileViewModeling {
    
    //MARK - Output
    var image: String { get }
    var username: String { get }
    
}

class ProfileViewModel: ProfileViewModeling {
    
    
    var image: String
    
    var username: String
    
    init(user: GitHubUser) {
        image = user.avatarUrl
        username = user.username
    }
    
    
}
