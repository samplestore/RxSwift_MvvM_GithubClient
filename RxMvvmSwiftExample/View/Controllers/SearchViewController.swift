//
//  SearchViewViewController.swift
//  RxMvvmSwiftExample
//
//  Created by Seongjae Lee on 2018. 9. 5..
//  Copyright © 2018년 Gunter. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SVProgressHUD
import SDWebImage

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    private var profileViewModel: ProfileViewModeling!
    
    var viewModel: SearchViewModeling!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SearchViewModel(gitHubService: GitHubService())
        setupBinding()
    }
    
    private func setupBinding() {
        
        viewModel.progressBinding.bind(to: SVProgressHUD.rx.isAnimating).disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .bind(to:viewModel.searchText)
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .map { $0.row }
            .bind(to: viewModel.cellDidSelect)
            .disposed(by: disposeBag)
        
        tableView.rx.contentOffset
            .subscribe(onNext: { [unowned self] _ in
                if self.searchBar.isFirstResponder {
                    self.searchBar.resignFirstResponder()
                }
            }).disposed(by: disposeBag)
                
        viewModel.cellModels.bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: IndexPath(row: row, section: 0)) as! UserCell
            //print(element.avatarUrl)
            cell.userLabel.text = element.username
            cell.userImage.sd_setImage(with: URL(string: element.avatarUrl), placeholderImage: UIImage(named: "user2"))
            return cell
            }
            .disposed(by: disposeBag)
 
        viewModel.resultCountLabel
            .bind(to: resultsLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.presentProfile.subscribe(onNext: { [unowned self] viewModel in
            print(viewModel)
            self.profileViewModel = viewModel
            self.performSegue(withIdentifier: "Profile", sender: self)
            
        }).disposed(by: disposeBag)
        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Profile" {
            let controller = segue.destination as! ProfileViewController
            controller.viewModel = profileViewModel
        }
    }
    

}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

