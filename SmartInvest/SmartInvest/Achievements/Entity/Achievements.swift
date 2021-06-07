//
//  Achievements.swift
//  SmartInvest
//
//  Created by Ashh on 6/6/21.
//

import Foundation

/// Datasource Codable model
struct Achievements: Codable {
    let success: Bool
    let status: Int
    let overview: Overview
    let achievements: [Achievement]
    
    init() {
        self.success = false
        self.status = 400
        self.overview = Overview(title: "Smart Investing")
        self.achievements = []
    }
    
    /// Load image from url
    /// - Parameter index: image at indexPath
    /// - Returns: ImageOperation instance with downloaded/ default image
    func loadImageForAchievement(at index: Int) -> ImageOperation? {
        guard let backgroundImage = URL(string: achievements[index].bgImageURL) else {
            return ImageOperation()
        }
        return ImageOperation(url: backgroundImage)
    }
    
    /// Overview datasource model
    struct Overview: Codable {
        let title: String
    }
    
    /// Achievement datasource model
    struct Achievement: Codable {
        let id: Int
        let level: String
        let progress: Int
        let total: Int
        let bgImageURL: String
        let accessible: Bool

        enum CodingKeys: String, CodingKey {
            case id, level, progress, total
            case bgImageURL = "bg_image_url"
            case accessible
        }
        
        init() {
            self.id = 0
            self.level = "0"
            self.progress = 0
            self.total = 0
            self.bgImageURL = ""
            self.accessible = false
        }
    }
}
