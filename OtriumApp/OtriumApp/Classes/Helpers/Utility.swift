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
    class UserDefaultsSetup {
        class func saveCachingTime () {
            UserDefaults.standard.set(DateSection.timeInSecond(), forKey: Constant.Strings.CURRENT_TIME_SECOND)
            //UserDefaults.standard.set(0, forKey: Constant.Strings.CURRENT_TIME_SECOND)
            UserDefaults.standard.synchronize()
        }
        class func getCachingTime () -> Int {
            let currentTime = UserDefaults.standard.integer(forKey: Constant.Strings.CURRENT_TIME_SECOND)
            return currentTime
        }
    }
    
    class DateSection {
        class func getToday() -> Date{
            return Date()
        }
        
        class func findNextDay(_ date: Date = Date(), _ day: Int = 1) -> Date{
            let calendar = Calendar.current
            let mydate = calendar.date(byAdding: DateComponents(day: day), to: date)!
            return mydate
        }
        
        class func timeInSecond(_ date: Date = Date()) -> Int {
            let myTime = Int(date.timeIntervalSince1970)
            return myTime
        }
        
        class func secondIntoDate(_ seconds: Int? = 0) -> Date{
            let newDate = Date(timeIntervalSince1970: TimeInterval(seconds!))
            return newDate
        }
        
    }
}
