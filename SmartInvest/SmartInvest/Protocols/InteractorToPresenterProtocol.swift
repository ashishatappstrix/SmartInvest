//
//  AchievementsPresenterProtocol.swift
//  SmartInvest
//
//  Created by Ashh on 6/6/21.
//

import Foundation

protocol InteractorToPresenterProtocol: AnyObject {
    func achievementsFetched(achievements: Achievements)
    func achievementsFetchFailed()
}
