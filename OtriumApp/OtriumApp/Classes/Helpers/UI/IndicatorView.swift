//
//  IndicatorView.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import NVActivityIndicatorView
import SwiftHEXColors

class IndicatorView: UIView {

    var indicatorView : NVActivityIndicatorView?
    
    private let presentingIndicatorTypes = {
        return NVActivityIndicatorType.allCases.filter { $0 != .blank }
    }()

    
    func startAnimating () {
        self.backgroundColor = UIColor.black
        self.alpha = 0.6
        
        let loaderFrame = CGRect(x: 0, y: 0, width: 60, height: 60)
        indicatorView = NVActivityIndicatorView(frame: loaderFrame,
                                                    type: presentingIndicatorTypes[11
            ])
        indicatorView?.center = self.center
        indicatorView?.color = UIColor(hexString: Constant.Colors.APP_THESE_DARK_BLUE)!
        //indicatorView?.backgroundColor = UIColor(hexString: Constant.Colors.APP_THESE_DARK_BLUE)
        self.addSubview(indicatorView!)
        indicatorView?.startAnimating()
    }
    
    func stopAnimating () {
        indicatorView?.stopAnimating()
    }
    
    func isAnimating () -> Bool {
        return indicatorView?.isAnimating ?? false
    }

}
