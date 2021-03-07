//
//  StarredCollectionCell.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import AlamofireImage

class StarredCollectionCell: UICollectionViewCell {
    
    static let identifier = "starredCollectionCell"
    
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
    var starredRepository: StarredRepository? {
        didSet {
            configureImage(starredRepository?.openGraphImageUrl)
            cellName.text = starredRepository?.name
            cellDescription.text = starredRepository?.description
            cellFork.text = "\(starredRepository?.forkCount ?? 0)"
            cellLanguage.text = starredRepository?.primaryLanguage?.name
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
