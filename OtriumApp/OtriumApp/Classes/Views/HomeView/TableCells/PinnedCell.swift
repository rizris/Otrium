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

    var mainView = UIView()
    var cellLogin = UILabel()
    var cellName = UILabel()
    var cellDescription = UILabel()
    var cellImage = UIImageView()
    var imgStar = UIImageView()
    var imgCircle = UIImageView()
    
    var cellFork = UILabel()
    var cellLanguage = UILabel()

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
