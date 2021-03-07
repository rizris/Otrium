//
//  MainCell.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import AlamofireImage

class MainCell: BaseCell {
    
    static let identifier = "mainCell"

    var mainView = UIView()
    var cellName = UILabel()
    var cellDescription = UILabel()
    var cellEmail = UILabel()
    var cellImage = UIImageView()
    var cellFollowers = UILabel()
    var cellFollowing = UILabel()
    
    var userModel: UserModel? {
        didSet {
            configureImage(userModel?.avatarUrl!, cellImage)
            cellName.text = userModel?.name
            cellDescription.text = userModel?.login
            cellEmail.text = userModel?.email
            cellFollowers.text = "\(userModel?.followers?.totalCount ?? 0) Followers"
            cellFollowing.text = "\(userModel?.following?.totalCount ?? 0) Following"
        }
    }
    
    /* ==================================================
     Need to override this method to load UI setup
     ================================================== */
    override func setupCellViews() {
        setupUIControls()
        
    }
    

    
}
