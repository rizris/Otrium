//
//  View-Main.swift
//  OtriumApp
//
//  Created by Rizvi on 3/10/21.
//

import UIKit

extension UIView {
    
    static func mainView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }
    
    static func cellMainView() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor(hexString: Constant.Colors.GRAY_LIGHT)?.cgColor
        view.layer.borderWidth = 1
        return view
    }
    
    
}
