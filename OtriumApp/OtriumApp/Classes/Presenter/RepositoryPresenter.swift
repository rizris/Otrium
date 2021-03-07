//
//  RepositoryPresenter.swift
//  OtriumApp
//
//  Created by Rizvi on 3/7/21.
//

import Foundation

/* ==================================================
 protocol setup for Home presenter
 ================================================== */
protocol RepositoryViewPresenter: class {
    init(view: ItemsRepositoryView)
    
    func viewDidLoad()
    
    var userModel : UserModel? {get set}
    var rowID : Int? {get}
    var type : Int? {get}
        
}

class RepositoryPresenter: RepositoryViewPresenter {
    
    weak var view: ItemsRepositoryView?
    
    var userModel: UserModel?
    
    var rowID : Int?
    var type : Int?
    
    
    required init(view: ItemsRepositoryView) {
        self.view = view
    }
    
    
    func viewDidLoad() {
        if let row = rowID {
            let pinnedMode = userModel?.pinnedItems?.edges[row]
            view?.loadRepositoryData(pinnedMode?.node)
        }
    }
    
}
