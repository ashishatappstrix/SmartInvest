//
//  AchievementsPresenterProtocol.swift
//  SmartInvest
//
//  Created by Ashh on 6/6/21.
//

import Foundation

protocol AchievementsPresenterProtocol {
    var view: AchievementsViewProtocol? { get set }
    var interactor: AchievementsInteractorProtocol? { get set }
    var router: AchievementsRouterProtocol? { get set }
    
    func fetchAchievements()
    func infoButtonTapped()
}
