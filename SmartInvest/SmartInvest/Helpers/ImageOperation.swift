//
//  ImageOperation.swift
//  SmartInvest
//
//  Created by Ashh on 6/7/21.
//

import Foundation
import UIKit

class ImageOperation: Operation {
    var url: URL
    var downloadedImage: UIImage?
    var loadingCompletionHandler: ((UIImage) -> Void)?
    
    init(url: URL) {
        self.url = url
    }
    
    override init() {
        self.url = URL(string: AppConstants.Resources.defaultImageUrl)!
    }
    
    private func updateCompletion(with image: UIImage = #imageLiteral(resourceName: "default_image.png")) {
        self.downloadedImage = image
        if let loadingCompletionHandler = loadingCompletionHandler {
            loadingCompletionHandler(image)
        }
    }
    
    override func main() {
        if isCancelled { return }
        
        if let cachedImage = ImageCache.shared.object(forKey: url.absoluteString as NSString), let loadingCompletionHandler = loadingCompletionHandler {
            loadingCompletionHandler(cachedImage)
            return
        }
        
        guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
            updateCompletion()
            return
        }
        
        if isCancelled  { return }
        ImageCache.shared.setObject(image, forKey: url.absoluteString as NSString)
        updateCompletion(with: image)
    }
}
