//
//  Router.swift
//  SmartInvest
//
//  Created by Ashh on 6/6/21.
//

import UIKit

class Router: AchievementsRouterProtocol {
    
    /// Initialize viewController with VIPER model
    /// - Returns: ViewController to display
    static func initAchievements() -> AchievementsViewController {
        
        let storyboard = UIStoryboard(name: AppConstants.Identifiers.mainId,
                                      bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: AppConstants.Identifiers.achievementsId) as? AchievementsViewController else  {
            fatalError()
        }
        
        var presenter: AchievementsPresenterProtocol & InteractorToPresenterProtocol = AchievementsPresenter()
        let interactor: AchievementsInteractorProtocol = AchievementsInteractor()
        let router: AchievementsRouterProtocol = Router()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
