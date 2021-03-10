//
//  PinnedPresenter.swift
//  OtriumApp
//
//  Created by Rizvi on 3/7/21.
//

import UIKit
import Apollo

/* ==================================================
 protocol setup for Home presenter
 ================================================== */
protocol PinnedViewPresenter: class {
    init(view: ItemsPinnedView)
    
    var userModel : UserModel? {get set}
    //func viewDidLoad()
    func loadRepositories(_ username: String)
    
    var repositoryModel : MainModel? {get set}

    func showAlertMessage(_ message: String)
    func showIndicator(_ status: Bool)
    
}

class PinnedPresenter: PinnedViewPresenter {
    
    weak var view: ItemsPinnedView?
    
    var userModel: UserModel?
    
    var repositoryModel : MainModel?
    
    
    
    required init(view: ItemsPinnedView) {
        self.view = view
    }
    
    /* ==================================================
     Used to load all repositories
     ================================================== */
    func loadRepositories(_ username: String) {
        showIndicator(true)
        Network.shared.apollo.fetch(query:GitRepositoryQuery(login: username, items: 20), cachePolicy: .returnCacheDataElseFetch) { result in
        //Network.shared.apollo.fetch(query:GitRepositoryQuery(login: username, items: 20)) { result in
            self.showIndicator(false)
            switch result {
                case .success(let graphQLResult):
                    if let item = graphQLResult.data?.user {
                        let json = item.jsonObject
                        let myData = try! JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
                        
                        let newValueData = try? JSONDecoder().decode(MainModel.self, from: myData)
                        
                        DispatchQueue.main.async {
                            if let newValueData = newValueData {
                                self.repositoryModel = newValueData
                                self.view?.loadRepository(newValueData)
                            }else{
                                self.showAlertMessage("Please try again")
                            }
                        }
                    }else {
                        self.showAlertMessage("Invalid profile")
                    }
                case .failure(let error):
                    print("Failure! Error: \(error)")
                    self.showAlertMessage("Please try again")
            }
        }
    }
    
    
    /* ==================================================
     Used to fetch user profile deta
     ================================================== */
    func loadUserData () {
        //showIndicator(true)
       
    }
    
    /* ==================================================
     Used to show alert message
     ================================================== */
    func showAlertMessage(_ message: String) {
        view?.alertMessage(message)
    }
    
    /* ==================================================
     Used to show indicator view for long run taks
     ================================================== */
    func showIndicator(_ status: Bool) {
        view?.activityIndicator(status)
    }
    
}
