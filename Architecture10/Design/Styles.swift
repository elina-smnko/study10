//
//  Styles.swift
//  Architecture10
//
//  Created by Elina Semenko on 31.03.2022.
//

import UIKit

extension UIColor {
    static var myAppRed: UIColor {
        return UIColor(red: 1, green: 0.1, blue: 0.1, alpha: 1)
    }
    static var myAppGreen: UIColor {
        return UIColor(red: 0, green: 1, blue: 0, alpha: 1)
    }
    static var myAppBlue: UIColor {
        return UIColor(red: 0, green: 0.2, blue: 0.9, alpha: 1)
    }
}

extension UIFont {
    static var myAppTitle: UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    static var myAppBody: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
}
