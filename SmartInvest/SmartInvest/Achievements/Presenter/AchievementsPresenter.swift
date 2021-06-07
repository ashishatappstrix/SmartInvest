//
//  AchievementsPresenter.swift
//  SmartInvest
//
//  Created by Ashh on 6/6/21.
//

import Foundation
 
class AchievementsPresenter: AchievementsPresenterProtocol {
    weak var view: AchievementsViewProtocol?
    var interactor: AchievementsInteractorProtocol?
    var router: AchievementsRouterProtocol?
    
    /// Fetch achievements
    func fetchAchievements() {
        interactor?.fetchAchievements()
    }
    
    /// Handle info button when tapped
    func infoButtonTapped() {
        view?.displayInfo()
    }
}

extension AchievementsPresenter: InteractorToPresenterProtocol {
    /// Achievements fetch successfull
    /// - Parameter achievements: List of achievements
    func achievementsFetched(achievements: Achievements) {
        view?.showAchievements(with: achievements)
    }
    
    /// Achievements fetch failed
    func achievementsFetchFailed() {
        view?.handleError()
    }
}
