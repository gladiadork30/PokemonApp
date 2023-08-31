//
//  UIImageView_Ext.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 29/08/23.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadFrom(URLAddress: String) {
        
        Task {
            if let url = URL(string: URLAddress), let (imageData, _) = try? await URLSession.shared.data(from: url) {
                if let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = loadedImage
                    }
                }
            }
        }
    }
}

