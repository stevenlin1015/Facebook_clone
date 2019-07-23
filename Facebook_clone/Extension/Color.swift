//
//  Color.swift
//  Facebook_clone
//
//  Created by Steven on 2019/7/22.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static let facebookBackgroundColor = UIColor(red: 205/255, green: 208/255, blue: 213/255, alpha: 1.0)
}
