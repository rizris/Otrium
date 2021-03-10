//
//  Button-Main.swift
//  OtriumApp
//
//  Created by Rizvi on 3/10/21.
//

import UIKit

extension UIButton {
    
    static func cellMoreButton() -> UIButton {
        let button = UIButton()
        button.setTitle("View All", for: .normal)
        button.setupFontAndColor()
        button.makeRightAlignment()
        return button
    }
}
