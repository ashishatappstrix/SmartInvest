//
//  AchievementTableViewCell.swift
//  SmartInvest
//
//  Created by Ashh on 6/6/21.
//

import UIKit

class AchievementTableViewCell: UITableViewCell {

    @IBOutlet weak var cellStateView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var levelValue: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var maxScore: UILabel!
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    /// Set cell controls from  State for enabled and disabled cell
    /// - Parameter state: Determines if cell is enabled or disabled
    private func setUI(for state: CellState = .disabled) {
        levelView.layer.masksToBounds = true
        levelView.layer.cornerRadius = levelView.bounds.width / 2
        levelView.alpha = 0.8
        backgroundImageView.layer.cornerRadius = 20
        // Set the rounded edge for the outer bar
        progressBar.layer.cornerRadius = 5
        progressBar.clipsToBounds = true
        // Set the rounded edge for the inner bar
        progressBar.layer.sublayers![1].cornerRadius = 5
        progressBar.subviews[1].clipsToBounds = true
        updateCell(from: state)
    }
    
    /// Update cell display
    /// - Parameter state: Determines if cell is enabled or disabled
    private func updateCell(from state: CellState) {
        if state == .disabled {
            cellStateView.alpha = 0.5
            self.isUserInteractionEnabled = false
        } else {
            cellStateView.alpha = 0
            self.isUserInteractionEnabled = true
        }
    }
    
    /// Update cell with data
    /// - Parameter achievement: datasource for cell
    func updateCell(with achievement: Achievements.Achievement) {
        levelView.layer.borderColor = UIColor.black.cgColor
        levelValue.text = achievement.level
        maxScore.text = String(achievement.total) + AppConstants.points
        userScore.text = String(achievement.progress) + AppConstants.points
        progressBar.progress = Float(achievement.progress) / Float (achievement.total)
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        updateCell(from: achievement.accessible ? .enabled : .disabled)
    }
    
    /// Update cell with downloaded/ default image
    /// - Parameter image: background image for cell
    func updateCell(with image: UIImage) {
        DispatchQueue.main.async {
            self.backgroundImageView.image = image
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
}

enum CellState {
    case enabled
    case disabled
}
