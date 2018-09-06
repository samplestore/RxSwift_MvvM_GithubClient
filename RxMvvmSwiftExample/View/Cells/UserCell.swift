//
//  UserCell.swift
//  RxMvvmSwiftExample
//
//  Created by Seongjae Lee on 2018. 9. 5..
//  Copyright © 2018년 Gunter. All rights reserved.
//

import UIKit
import Spring
import RxSwift
import RxCocoa

class UserCell: UITableViewCell {
    
    @IBOutlet weak var userImage: DesignableImageView!
    @IBOutlet weak var userLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
