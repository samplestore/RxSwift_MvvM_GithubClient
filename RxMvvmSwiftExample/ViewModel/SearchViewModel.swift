//
//  SearchViewModel.swift
//  RxMvvmSwiftExample
//
//  Created by Seongjae Lee on 2018. 9. 5..
//  Copyright © 2018년 Gunter. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


protocol SearchViewModeling {
    
    // MARK: - Input
    var searchText: PublishSubject<String> { get }
    var progressBinding: Observable<Bool> { get }
    var cellDidSelect: PublishSubject<Int> { get }
    
    //var cellDidSelect: PublishSubject<Int> { get }
    // Mark - Output
    var cellModels: Observable<[GitHubUser]>! { get }
    var searchResults: Observable<GitHubUserSearch>! { get }
    var resultCountLabel: Observable<String>! { get }
    var presentProfile: Observable<ProfileViewModeling>! { get }
}

class SearchViewModel: SearchViewModeling {
    
    //let gitHubService: GitHubServicing  = GitHubService()
    
    // MARK: - Input
    var searchText: PublishSubject<String> = PublishSubject<String>()
    /// Is process in progress
    let progressView : ActivityIndicator = ActivityIndicator()
    var progressBinding: Observable<Bool> {
        return progressView.asObservable()
    }
    var cellDidSelect: PublishSubject<Int> = PublishSubject<Int>()
    
    // Mark - Output
    var cellModels: Observable<[GitHubUser]>!
    var searchResults: Observable<GitHubUserSearch>!
    var resultCountLabel: Observable<String>!
    var presentProfile: Observable<ProfileViewModeling>!
    
    init(gitHubService: GitHubServicing){
        
        searchResults = searchText
            .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest({ (query) -> Observable<GitHubUserSearch> in
                
                print(query)
                
                return gitHubService.userSearch(query: query)
                    .trackActivity(self.progressView)
                    .catchErrorJustReturn(GitHubUserSearch(count: 0, users: []))
                
            })
            .observeOn(MainScheduler.instance)
            .startWith(GitHubUserSearch(count: 0, users: []))
            .share(replay: 1)
        
        resultCountLabel = searchResults.map { "\($0.users.count) result(s)" }
        
        cellModels = searchResults.map { userSaerch in
            userSaerch.users
        }
        
        
        presentProfile = cellDidSelect
            .withLatestFrom(searchResults) { (cell, results) ->(Int,GitHubUserSearch) in
                print("present Profile\(results)")
                return (cell,results)
            }.map { cell, results in
                ProfileViewModel(user: results.users[cell])
        }
    }
    
    
}
