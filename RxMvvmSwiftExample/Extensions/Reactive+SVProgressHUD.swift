//
//  Reactive+SVProgressHUD.swift
//  RxMvvmSwiftExample
//
//  Created by Seongjae Lee on 2018. 9. 6..
//  Copyright © 2018년 Gunter. All rights reserved.
//

import Foundation
import SVProgressHUD
import RxSwift
import RxCocoa

extension Reactive where Base: SVProgressHUD {
    
    public static var isAnimating: Binder<Bool> {
        return Binder(UIApplication.shared) {progressHUD, isVisible in
            if isVisible {
                SVProgressHUD.setBackgroundLayerColor(UIColor.black)
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }
    }
    
}
