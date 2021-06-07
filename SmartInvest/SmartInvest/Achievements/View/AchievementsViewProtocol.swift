//
//  AchievementsViewProtocol.swift
//  SmartInvest
//
//  Created by Ashh on 6/7/21.
//

import Foundation

protocol AchievementsViewProtocol: AnyObject {
    func showAchievements(with achievements: Achievements)
    func displayInfo()
    func handleError()
}
