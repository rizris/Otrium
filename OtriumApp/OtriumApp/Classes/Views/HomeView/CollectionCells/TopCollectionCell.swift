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
