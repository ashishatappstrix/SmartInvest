//
//  AchievementsInteractorProtocol.swift
//  SmartInvest
//
//  Created by Ashh on 6/7/21.
//

import Foundation

protocol AchievementsInteractorProtocol: AnyObject {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchAchievements()
}
