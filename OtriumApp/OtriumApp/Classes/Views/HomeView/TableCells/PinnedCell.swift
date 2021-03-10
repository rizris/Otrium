//
//  PinnedCell.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import AlamofireImage

class PinnedCell: BaseCell {

    static let identifier = "pinnedCell"

    lazy var mainView: UIView = UIView.cellMainView()
    lazy var cellLogin: UILabel = UILabel.profileLogin()
    lazy var cellName: UILabel = UILabel.profileName()
    lazy var cellDescription: UILabel = UILabel.profileCommonLabel()
    lazy var cellFork: UILabel = UILabel.profileCommonLabel()
    lazy var cellLanguage: UILabel = UILabel.profileCommonLabel()
    lazy var cellImage: UIImageView = UIImageView.cellProfileImage()
    lazy var imgStar: UIImageView = UIImageView.starImage()
    lazy var imgCircle: UIImageView = UIImageView.circleImage()

    var userModel: UserModel? {
        didSet {
            cellLogin.text = userModel?.login
        }
    }
    
    var pinnedModel: PinndedModel? {
        didSet {
            configureImage(pinnedModel?.openGraphImageUrl, cellImage)
            cellName.text = pinnedModel?.name
            cellDescription.text = pinnedModel?.description
            cellFork.text = "\(pinnedModel?.forkCount ?? 0)"
            cellLanguage.text = pinnedModel?.primaryLanguage?.name
        }
    }
    
    
    
    /* ==================================================
     Need to override this method to load UI setup
     ================================================== */
    override func setupCellViews() {
        setupUIControls()
        
        
    }
    
 
    
}
