//
//  AchievementsViewController.swift
//  SmartInvest
//
//  Created by Ashh on 6/6/21.
//
import UIKit

class AchievementsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var shimmerView: ShimmerView!
    
    var presenter: AchievementsPresenterProtocol?
    var datasource = Achievements()
    var loadingQueue = OperationQueue()
    var loadingOperation : [IndexPath : ImageOperation] = [:]
    
    // Navigation Bar Button Item
    lazy var infoBarButtonItem: UIBarButtonItem = {
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        let button = UIBarButtonItem(customView: infoButton)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        shimmerView.isHidden = false
        shimmerView.startAnimating()
        self.navigationItem.title = datasource.overview.title
        self.navigationItem.rightBarButtonItem = infoBarButtonItem
        presenter?.fetchAchievements()
    }
    
    /// Display info when info button is tapped
    @objc func infoButtonTapped() {
        presenter?.infoButtonTapped()
    }
}

// MARK: Table view DataSource and Table view Delegate methods
extension AchievementsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.Identifiers.achievementsCellId) as? AchievementTableViewCell else {
            fatalError()
        }
        
        cell.updateCell(with: datasource.achievements[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? AchievementTableViewCell else {
            fatalError()
        }
        
        let updateCellClosure: ((UIImage) -> Void) = { [weak self] image in
            cell.updateCell(with: image)
            self?.loadingOperation.removeValue(forKey: indexPath)
        }
        
        if let dataLoader = loadingOperation[indexPath] {
            if let outputImage = dataLoader.downloadedImage {
                cell.updateCell(with: outputImage)
                loadingOperation.removeValue(forKey: indexPath)
            } else {
                dataLoader.loadingCompletionHandler = updateCellClosure
            }
        } else {
            if let dataLoader = datasource.loadImageForAchievement(at: indexPath.row) {
                dataLoader.loadingCompletionHandler = updateCellClosure
                loadingQueue.addOperation (dataLoader)
                loadingOperation[indexPath] = dataLoader
            }
        }
    }
}

// View Protocol to display content
extension AchievementsViewController: AchievementsViewProtocol {
    
    /// Show list of achievements
    /// - Parameter achievements: datasource of the view controller
    func showAchievements(with achievements: Achievements) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.datasource = achievements
            self.shimmerView.isHidden = true
            self.shimmerView.stopAnimation()
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    /// Handle any error to be displayed on screen
    func handleError() {
    }
    
    /// Display Alert when info button is tapped
    func displayInfo() {
        let alertController = UIAlertController(title: AppConstants.InfoAlert.title,
                                                message: AppConstants.InfoAlert.message,
                                                preferredStyle: .alert)
        let alertAction = UIAlertAction(title: AppConstants.InfoAlert.actionTitle,
                                        style: .cancel)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
