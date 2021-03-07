//
//  Label+Ex.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit

extension UILabel {
    
    func leftRightPadding(_ amount:CGFloat){
      
    }
    
    func backgroundColorAndFont () {
        self.textColor = UIColor(hexString: Constant.Colors.TEXT_NORNAL)
        self.font = UIFont(name: Constant.Strings.APP_FONT_NAME, size: 16)
        self.backgroundColor = UIColor(hexString: Constant.Colors.TEXT_BACKGROUND)
    }
    func fontAndColorNoBackground () {
        self.backgroundColor = Constant.Colors.CLEAR
        self.textColor = UIColor(hexString: Constant.Colors.TEXT_NORNAL)
        self.font = UIFont(name: Constant.Strings.APP_FONT_NAME, size: 17)
    }
    
    func fontAndColorNoBackgroundCenter (_ color: String = Constant.Colors.TEXT_NORNAL, _ size: CGFloat = 16) {
        self.textAlignment = .center
        self.backgroundColor = Constant.Colors.CLEAR
        self.textColor = UIColor(hexString: color)
        self.font = UIFont(name: Constant.Strings.APP_FONT_NAME, size: size)
    }
    func fontTitleNoBackgroundCenter (_ color: String = Constant.Colors.TEXT_NORNAL, _ size: CGFloat = 16) {
        self.textAlignment = .center
        self.backgroundColor = Constant.Colors.CLEAR
        self.textColor = UIColor(hexString: color)
        self.font = UIFont(name: Constant.Strings.APP_FONT_NAME_BOLD, size: size)
    }
    func fontColorNoBackground (_ color: String = Constant.Colors.PRIMARY_BLUE) {
        self.backgroundColor = Constant.Colors.CLEAR
        self.textColor = UIColor(hexString: color)
        self.font = UIFont(name: Constant.Strings.APP_FONT_NAME, size: 17)
    }
    func fontTitleColorNoBackground (_ color: String = Constant.Colors.TEXT_NORNAL, _ size: CGFloat = 20) {
        self.backgroundColor = Constant.Colors.CLEAR
        self.textColor = UIColor(hexString: color)
        self.font = UIFont(name: Constant.Strings.APP_FONT_NAME_BOLD, size: size)
    }
    func fontAndReadOnly () {
        self.backgroundColor = UIColor(hexString: Constant.Colors.TEXT_BROWN)
        self.textColor = UIColor(hexString: Constant.Colors.TEXT_NORNAL)
        self.font = UIFont(name: Constant.Strings.APP_FONT_NAME, size: 16)
        self.layer.cornerRadius = 5
    }
    
    
}
