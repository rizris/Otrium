//
//  ViewController.swift
//  OtriumApp
//
//  Created by Rizvi on 3/5/21.
//

import UIKit
import Apollo

class ViewController: UIViewController {

    var userArray: UserModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //check()
    }

    /*
    func check () {
        
        Network.shared.apollo.fetch(query: UserProfileQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            let item = graphQLResult.data?.user
            print(item)
            if let item = item {
                self.userArray = UserModel(item)
                print("hi")
            }
            
            print("Success! Result: \(graphQLResult)")
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }*/
    
}

