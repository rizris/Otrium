//
//  TopCollectionCell.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import AlamofireImage

class TopCollectionCell: UICollectionViewCell {
    
    static let identifier = "topCollectionCell"
    
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
    var topRepository: TopRepository? {
        didSet {
            configureImage(topRepository?.openGraphImageUrl)
            cellName.text = topRepository?.name
            cellDescription.text = topRepository?.description
            cellFork.text = "\(topRepository?.forkCount ?? 0)"
            cellLanguage.text = topRepository?.primaryLanguage?.name
        }
    }
    
    func setupCellView () {
        setupUIControls()
    }
    
    func configureImage (_ url: String?) {
        if let myurl = url {
            if let imageurl = URL(string: myurl) {
                let filter = AspectScaledToFillSizeFilter(size: (cellImage.frame.size))
                cellImage.contentMode = .scaleAspectFit
                cellImage.af.setImage(withURL: imageurl, placeholderImage: UIImage.init(named: "girl"), filter: filter, completion: { [self] (response) in
                    cellImage.contentMode = .scaleToFill
                })
            }else{
                cellImage.image = UIImage.init(named: "girl")
                cellImage.contentMode = .scaleAspectFit
            }
        }else {
            cellImage.image = UIImage.init(named: "girl")
            cellImage.contentMode = .scaleAspectFit
        }
    }
    
}
