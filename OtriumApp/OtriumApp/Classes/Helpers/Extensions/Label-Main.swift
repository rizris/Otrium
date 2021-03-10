//
//  Label-Main.swift
//  OtriumApp
//
//  Created by Rizvi on 3/10/21.
//

import UIKit

extension UILabel {
    
    static func profileName() -> UILabel {
        let label = UILabel()
        label.text = ""
        label.fontTitleColorNoBackground()
        return label
    }
    
    static func profileLogin() -> UILabel {
        let label = UILabel()
        label.text = "Roja"
        label.fontAndColorNoBackground()
        return label
    }
    
    static func profileEmail() -> UILabel {
        let label = UILabel()
        label.text = ""
        label.fontAndColorNoBackground()
        return label
    }
    
    static func profileFollowers() -> UILabel {
        let label = UILabel()
        label.text = ""
        label.fontAndColorNoBackground()
        return label
    }
    
    static func profileFollowing() -> UILabel{
        let label = UILabel()
        label.text = ""
        label.fontAndColorNoBackground()
        return label
    }
    
    static func profileCommonLabel() -> UILabel{
        let label = UILabel()
        label.text = ""
        label.fontAndColorNoBackground()
        return label
    }
    
    static func cellHeaderTitle() -> UILabel {
        let label = UILabel()
        label.fontTitleColorNoBackground()
        return label
    }
    

    
}
