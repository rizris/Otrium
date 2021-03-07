//
//  RepositoryView.swift
//  OtriumApp
//
//  Created by Rizvi on 3/7/21.
//

import UIKit

/* ==================================================
 Procols setup for Pinned view
 ================================================== */
protocol ItemsRepositoryView: class {
    
    func loadRepositoryData(_ pinnedModel: PinndedModel?)
    
}

class RepositoryView: BaseView {

    var presenter: RepositoryViewPresenter!
    
    var pinnedModel: PinndedModel?
    
    var userImage = UIImageView()
    var userName = UILabel()
    var userDescription = UILabel()
    var userFork = UILabel()
    var userLanguage = UILabel()
    var imgStar = UIImageView()
    var imgCircle = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
        
        initialLoad()
    }
    
    
    private func initialLoad() {
        setupUIControls()
    }

    private func updateRepositoryData() {
        configureImage(pinnedModel?.openGraphImageUrl, userImage)
        userName.text = pinnedModel?.name
        userDescription.text = pinnedModel?.description
    }
    private func alertMessage(_ message: String) {
        let alert = UIAlertController(title: Constant.App.APP_NAME, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}

extension RepositoryView: ItemsRepositoryView {
    
    func loadRepositoryData(_ pinnedModel: PinndedModel?) {
        guard let  pinnedModel = pinnedModel else {
            alertMessage("Sorry no repository found")
            return
        }
        self.pinnedModel = pinnedModel
        DispatchQueue.main.async {
            self.updateRepositoryData()
        }
    }
    
    
}
