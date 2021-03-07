//
//  Utility.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit

class Utility {
    
    class Animating {
        let activityView = IndicatorView()
        
        func startAnimating(_ view: UIView){
            view.addSubview(activityView)
            //activityView.frame = view.frame
            activityView.frame.size = UIScreen.main.bounds.size
            activityView.startAnimating()
        }
        
        func stopAnimating(){
            activityView.stopAnimating()
            activityView.removeFromSuperview()
        }
        
        func isAnimating() -> Bool{
            return activityView.isAnimating()
        }
    }
    
    class Common {
        class func showDestination(_ selfView: UIViewController, _ destination: UIViewController) {
            selfView.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
            selfView.navigationController?.pushViewController(destination, animated: false)
        }
    }
}
