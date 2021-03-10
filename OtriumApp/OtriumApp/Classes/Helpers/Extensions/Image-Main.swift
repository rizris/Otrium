//
//  Image-Main.swift
//  OtriumApp
//
//  Created by Rizvi on 3/10/21.
//

import UIKit


extension UIImageView {
    
    static func profileImage() -> UIImageView {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "girl")
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 40
        imgView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        imgView.clipsToBounds = true
        return imgView
    }
    
    static func starImage() -> UIImageView {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "star")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }
    static func circleImage() -> UIImageView {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "circle")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }
    static func cellProfileImage() -> UIImageView {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "girl")
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 25
        imgView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imgView.clipsToBounds = true
        return imgView
    }
   
    
}
