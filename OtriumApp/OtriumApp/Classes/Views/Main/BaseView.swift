//
//  BaseView.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import AlamofireImage

class BaseView: UIViewController, UINavigationControllerDelegate {

    let utilityAnimating = Utility.Animating()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(hexString: Constant.Colors.PRIMARY_WHITE)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
    }
    
    /* ==================================================
     Used to load remote images
     ================================================== */
    func configureImage (_ url: String?, _ cellImage: UIImageView) {
        if let myurl = url {
            if let imageurl = URL(string: myurl) {
                let filter = AspectScaledToFillSizeFilter(size: (cellImage.frame.size))
                cellImage.contentMode = .scaleAspectFit
                cellImage.af.setImage(withURL: imageurl, placeholderImage: UIImage.init(named: "girl"), filter: filter, completion: { response in
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

    func startAnimating () {
        if !utilityAnimating.isAnimating(){
            utilityAnimating.startAnimating(view)
        }
    }
    
    func stopAnimating () {
        utilityAnimating.stopAnimating()
    }

}
