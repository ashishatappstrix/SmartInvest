//
//  AchievementsInteractor.swift
//  SmartInvest
//
//  Created by Ashh on 6/6/21.
//

import Foundation

class AchievementsInteractor: AchievementsInteractorProtocol {
    weak var presenter: InteractorToPresenterProtocol?
    
    /// Fetch list of achievements
    func fetchAchievements() {
        guard let url = Bundle.main.url(forResource: AppConstants.Resources.achievementsJson,
                                        withExtension: AppConstants.Resources.fileType) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let achievements = try decoder.decode(Achievements.self, from: data)
            
            self.presenter?.achievementsFetched(achievements: achievements)
            
        } catch {
            self.presenter?.achievementsFetchFailed()
        }
    }
}
