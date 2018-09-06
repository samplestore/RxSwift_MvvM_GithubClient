//
//  ProfileViewController.swift
//  RxMvvmSwiftExample
//
//  Created by Seongjae Lee on 2018. 9. 6..
//  Copyright © 2018년 Gunter. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Spring
import SDWebImage

class ProfileViewController: UIViewController {

    @IBOutlet weak var userImage: DesignableImageView!
    @IBOutlet weak var userLabel: UILabel!
    
    var viewModel: ProfileViewModeling!

    private var disposeBag = DisposeBag()
    
    var subscriptions: [Disposable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = viewModel.username
        userImage.sd_setImage(with: URL(string: viewModel.image), placeholderImage: UIImage(named: "user2"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
