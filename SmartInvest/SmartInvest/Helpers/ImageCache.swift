//
//  ImageCache.swift
//  SmartInvest
//
//  Created by Ashh on 6/7/21.
//

import UIKit

class ImageCache {
    private init() {}
    static let shared = NSCache<NSString, UIImage>()
}
